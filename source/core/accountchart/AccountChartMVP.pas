unit AccountChartMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  PressMVPModel,
  PressMVPCommand,
  PressSubject,
  PressMVP;

type

  { TAccountChartEditPresenter }

  TAccountChartEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TAccountChartQueryPresenter }

  TAccountChartQueryPresenter = class(TCustomQueryPresenter)
  protected
    function InternalQueryItemsDisplayNames: string; override;
    class function InternalModelClass: TPressMVPObjectModelClass; override;
    procedure InitPresenter; override;
  end;

  { TAddAccountChildCommand }

  TAddAccountChildCommand = class(TPressMVPStructureCommand)
  protected
    function InternalIsEnabled: Boolean; override;
    procedure InternalExecute; override;
  end;

implementation

uses
  AccountChartBO,
  PressMVPPresenter,
  Forms,
  StdCtrls,
  Graphics;

{ TAddAccountChildCommand }

function TAddAccountChildCommand.InternalIsEnabled: Boolean;
var
  VAccountChart: TAccountChart;
begin
  Result := Model.Selection.Count = 1;
  if Result then
  begin
    VAccountChart := Model.Selection[0] as TAccountChart;
    Result := VAccountChart.CanHaveChild;
  end;
end;

procedure TAddAccountChildCommand.InternalExecute;
var
  VAccount: TAccountChart;
  VChildAccount: TAccountChart;
begin
  VAccount := Model.Selection[0] as TAccountChart;
  VChildAccount := TAccountChart.Create;
  VChildAccount.SetParentAccount(VAccount);
  TAccountChartEditPresenter.Run(VChildAccount)
end;

{ TAccountChartQueryPresenter }

function TAccountChartQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(120,"Código");' +
    'BasicUserRecordData.Name(235,"Nome");' +
    'ChildOf.BasicUserRecordData.Name(205,"Membro de");' +
    'Level(40,"Nível");' +
    'Balance(90,"Saldo");' +
    'ShortCode(80,"Cód. reduz.")';
end;

class function TAccountChartQueryPresenter.InternalModelClass: TPressMVPObjectModelClass;
begin
  Result := TCustomQueryModel;
end;

procedure TAccountChartQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('ShortCode', 'ShortCodeEdit');
  MainQueryPresenter.BindCommand(TAddAccountChildCommand, 'AddAccountChildButton');
end;

{ TAccountChartEditPresenter }

procedure TAccountChartEditPresenter.InitPresenter;
var
  VAccount: TAccountChart;
  VShortCodePresenter: TPressMVPPresenter;
  VShortCodeEdit: TEdit;
  VLevel: Integer;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  //CreateSubPresenter('ChildOf', 'ChildOfComboBox', 'BasicUserRecordData.Name');
  VShortCodePresenter := CreateSubPresenter('ShortCode', 'ShortCodeEdit');
  VAccount := Model.Subject as TAccountChart;
  VShortCodeEdit := VShortCodePresenter.View.Handle as TEdit;
  VLevel := VAccount.Level;
  { only level 3 accounts has shortcode }
  VShortCodeEdit.ReadOnly := not (VAccount.Level = ACCOUNT_LEVELTHREE);
  if VShortCodeEdit.ReadOnly then
    VShortCodeEdit.Color := clBtnFace
  else
    VShortCodeEdit.Color := clDefault;
end;

initialization
  TAccountChartEditPresenter.RegisterBO(TAccountChart);
  TAccountChartQueryPresenter.RegisterBO(TAccountChartQuery);

end.

