unit ReportItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TReportItemEditForm }

  TReportItemEditForm = class(TCustomEditForm)
    DesignButton: TBitBtn;
    CaptionEdit: TEdit;
    CaptionLabel: TLabel;
    VisibleCheckBox: TCheckBox;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ReportMVP,
  MainFrm;

{ TReportItemEditForm }

constructor TReportItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons32ImageList.GetBitmap(IMG_LAYOUT_EDIT, DesignButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TReportItemEditPresenter, TReportItemEditForm);

end.

