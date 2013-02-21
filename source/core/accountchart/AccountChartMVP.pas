unit AccountChartMVP;

{$mode objfpc}

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

initialization
  TAccountChartEditPresenter.RegisterBO(TAccountChart);

end.

