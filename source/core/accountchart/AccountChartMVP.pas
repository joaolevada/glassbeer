unit AccountChartMVP;

{$mode objfpc}

interface

uses
  {Classes,
  SysUtils}
  CustomMVP;

type

  { TAccountChartEditPresenter }

  TAccountChartEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TAccountChartQueryPresenter }

  TAccountChartQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string;
  end;

implementation

uses
  AccountChartBO;

{ TAccountChartEditPresenter }

procedure TAccountChartEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('ChildOf', 'ChildOfComboBox', 'BasicUserRecordData.Name');
  CreateSubPresenter('ShortCode', 'ShortCodeEdit');
end;

{ TAccountChartQueryPresenter }

procedure TAccountChartQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('ShortCode', 'ShortCodeEdit');
end;

function TAccountChartQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := {'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(280, "Nome");' +
    'ChildOf(150, "Membro de", BasicUserRecordData.Name);' +}
    'Balance(105, "Saldo");' +
    'ShortCode(40, "C.")';
end;

initialization
  TAccountChartEditPresenter.RegisterBO(TAccountChart);
  TAccountChartQueryPresenter.RegisterBO(TAccountChartQuery);

end.

