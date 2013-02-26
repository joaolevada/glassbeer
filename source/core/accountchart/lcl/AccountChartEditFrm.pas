unit AccountChartEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAccountChartEditForm }

  TAccountChartEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    NewShortCodeSpeedButton: TSpeedButton;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    ShortCodeEdit: TEdit;
    ShortCodeLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  AccountChartMVP,
  MainFrm;

{ TAccountChartEditForm }

constructor TAccountChartEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_EMOTICONGEAR,
    NewShortCodeSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TAccountChartEditPresenter, TAccountChartEditForm);

{$R *.lfm}

end.

