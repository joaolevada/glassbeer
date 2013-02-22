unit AccountChartMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  PressMVPModel;

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

implementation

uses
  AccountChartBO;

{ TAccountChartQueryPresenter }

function TAccountChartQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(120,"Código");' +
    'BasicUserRecordData.Name(235,"Nome");' +
    'ChildOf.BasicUserRecordData.Name(205,"Membro de");' +
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
end;

{ TAccountChartEditPresenter }

procedure TAccountChartEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  //CreateSubPresenter('ChildOf', 'ChildOfComboBox', 'BasicUserRecordData.Name');
  //CreateSubPresenter('ShortCode', 'ShortCodeEdit');
end;

initialization
  TAccountChartEditPresenter.RegisterBO(TAccountChart);
  TAccountChartQueryPresenter.RegisterBO(TAccountChartQuery);

end.

