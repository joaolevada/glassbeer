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
  PressMVP,
  PressNotifier;

type

  { TAccountChartEditPresenter }

  TAccountChartEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
    procedure SaveEvent(AEvent: TPressEvent); override;
  end;

  { TAccountChartQueryPresenter }

  TAccountChartQueryPresenter = class(TCustomQueryPresenter)
  protected
    function InternalQueryItemsDisplayNames: string; override;
    procedure InitPresenter; override;
  end;

  { TAddAccountChildCommand }

  TAddAccountChildCommand = class(TPressMVPStructureCommand)
  protected
    function InternalIsEnabled: Boolean; override;
    procedure InternalExecute; override;
  end;

  { TAccountNewShortCodeCommand }

  TAccountNewShortCodeCommand = class(TPressMVPObjectCommand)
  protected
    procedure InternalExecute; override;
    function InternalIsEnabled: Boolean; override;
  end;

implementation

uses
  AccountChartBO,
  PressMVPPresenter,
  Forms,
  StdCtrls,
  Graphics;

{ TAccountNewShortCodeCommand }

procedure TAccountNewShortCodeCommand.InternalExecute;
var
  VList: TPressProxyList;
  VAccount, VThisAccount: TAccountChart;
begin
  VList := Model.Session.OQLQuery('select * from ' +
    TAccountChart.ClassName +
    ' where Level = ' + IntToStr(ACCOUNT_LEVELTHREE) +
    ' order by ShortCode desc');
  if VList.Count > 0 then
  begin
    VAccount := VList.Items[0].Instance as TAccountChart;
    VThisAccount := Model.Subject as TAccountChart;
    VThisAccount.ShortCode := Succ(VAccount.ShortCode);
  end;
  VList.Free;
end;

function TAccountNewShortCodeCommand.InternalIsEnabled: Boolean;
var
  VAccount: TAccountChart;
begin
  VAccount := Model.Subject as TAccountChart;
  Result := VAccount.Level = ACCOUNT_LEVELTHREE;
end;

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
  Result := 'Code(120,"Código");' +
    'Name(235,"Nome do grupo/conta");' +
    'ChildOf.Name(205,"Membro do grupo");' +
    'Level(40,"Nível");' +
    'Balance(90,"Saldo");' +
    'ShortCode(80,"Cód. reduz.")';
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
  //VShortCodeEdit: TEdit;
  //VLevel: Integer;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  //CreateSubPresenter('ChildOf', 'ChildOfComboBox', 'Name');
  {VShortCodePresenter := }CreateSubPresenter('ShortCode', 'ShortCodeEdit');
  //VAccount := Model.Subject as TAccountChart;
  //VShortCodeEdit := VShortCodePresenter.View.Handle as TEdit;
  //VLevel := VAccount.Level;
  //BindCommand(TAccountNewShortCodeCommand, 'NewShortCodeSpeedButton');
end;

procedure TAccountChartEditPresenter.SaveEvent(AEvent: TPressEvent);
var
  VSuperAccount: TAccountChart;
begin
  inherited SaveEvent(AEvent);
  VSuperAccount := (Model.Subject as TAccountChart).ChildOf;
  { increment the number of childs }
  if Assigned(VSuperAccount) then
  begin
    VSuperAccount.ChildCount := VSuperAccount.ChildCount + 1;
  end;
end;

initialization
  TAccountChartEditPresenter.RegisterBO(TAccountChart);
  TAccountChartQueryPresenter.RegisterBO(TAccountChartQuery);

end.

