unit LogMVP;

{$mode objfpc}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

type

{ TGeneralLogPresenter }

  TGeneralLogEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  LogBO;

{ TGeneralLogPresenter }

procedure TGeneralLogEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RemarkedAt', 'RemarkedAtEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
end;

initialization
  TGeneralLogEditPresenter.RegisterBO(TGeneralLog);

end.

