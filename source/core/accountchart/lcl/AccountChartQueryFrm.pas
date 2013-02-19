unit AccountChartQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TAccountChartQueryForm }

  TAccountChartQueryForm = class(TCustomQueryForm)
    CodeBitBtn: TBitBtn;
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    DefaultTab1: TTabSheet;
    NameEdit: TEdit;
    NameEdit1: TEdit;
    NameLabel: TLabel;
    NameLabel1: TLabel;
    SearchButton1: TBitBtn;
    CodeTabSheet: TTabSheet;
    ShortCodeBitBtn: TBitBtn;
    ShortCodeEdit: TEdit;
    ShortCodeLabel: TLabel;
    ShortCodeTabSheet: TTabSheet;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AccountChartMVP,
  PressXCLBroker,
  MainFrm;

{ TAccountChartQueryForm }

constructor TAccountChartQueryForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons32ImageList.GetBitmap(IMG_ZOOM, CodeBitBtn.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_ZOOM, ShortCodeBitBtn.Glyph);
end;

initialization
  PressXCLForm(TAccountChartQueryPresenter, TAccountChartQueryForm);

{$R *.lfm}

end.

