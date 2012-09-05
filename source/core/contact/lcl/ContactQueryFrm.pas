unit ContactQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls;

type

  { TContactQueryForm }

  TContactQueryForm = class(TForm)
    AddPersonButton: TBitBtn;
    AddCompanyButton: TBitBtn;
    BottomPanel: TPanel;
    NameTabSheet: TTabSheet;
    NameEdit: TEdit;
    EditButton: TBitBtn;
    CodeEdit: TEdit;
    NameLabel: TLabel;
    CodeLabel: TLabel;
    QueryStringGrid: TStringGrid;
    RemoveButton: TBitBtn;
    SearchNameButton: TBitBtn;
    SearchCodeButton: TBitBtn;
    SearchPageControl: TPageControl;
    CodeTabSheet: TTabSheet;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  PressXCLBroker,
  ContactMVP,
  MainFrm;

{ TContactQueryForm }

constructor TContactQueryForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons32ImageList.GetBitmap(IMG_USER, AddPersonButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_FACTORY, AddCompanyButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_PENCIL, EditButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_DELETE, RemoveButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_ZOOM, SearchNameButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_ZOOM, SearchCodeButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TContactQueryPresenter, TContactQueryForm);

end.

