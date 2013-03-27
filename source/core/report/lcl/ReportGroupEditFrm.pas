unit ReportGroupEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids, Buttons, ExtCtrls;

type

  { TReportGroupEditForm }

  TReportGroupEditForm = class(TForm)
    AddReportButton: TBitBtn;
    BottomPanel: TPanel;
    EditReportButton: TBitBtn;
    RemoveReportButton: TBitBtn;
    ReportsLabel: TLabel;
    ReportsStringGrid: TStringGrid;
    SaveButton: TBitBtn;
    CancelButton: TBitBtn;
  public
    constructor Create(TheOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ReportMVP,
  CustomQueryFrm,
  MainFrm;

{ TReportGroupEditForm }

constructor TReportGroupEditForm.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  Self.Width := QUERYFORM_WIDTH;
  Self.Height := QUERYFORM_HEIGHT;
  MainForm.Icons32ImageList.GetBitmap(IMG_ADD, AddReportButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_PENCIL, EditReportButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_DELETE, RemoveReportButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_DISK, SaveButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_CANCEL, CancelButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TReportGroupEditPresenter, TReportGroupEditForm);

end.

