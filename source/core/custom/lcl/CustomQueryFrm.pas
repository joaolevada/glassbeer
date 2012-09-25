unit CustomQueryFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Buttons, Grids;

type

  { TCustomQueryForm }

  TCustomQueryForm = class(TForm)
    AddButton: TBitBtn;
    EditButton: TBitBtn;
    RemoveButton: TBitBtn;
    SearchButton: TBitBtn;
    BottomPanel: TPanel;
    SearchPageControl: TPageControl;
    DefaultTab: TTabSheet;
    QueryStringGrid: TStringGrid;
  public
    constructor Create(AOwner: TComponent); override;
  end;

const
  QUERYFORM_WIDTH = 850;
  QUERYFORM_HEIGHT = 478;

implementation

{$R *.lfm}

uses
  PressXCLBroker
  ,CustomMVP
  ,MainFrm;

{ TCustomQueryForm }

constructor TCustomQueryForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Width := QUERYFORM_WIDTH;
  Self.Height := QUERYFORM_HEIGHT;
  MainForm.Icons32ImageList.GetBitmap(IMG_ADD, AddButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_PENCIL, EditButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_DELETE, RemoveButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_ZOOM, SearchButton.Glyph);
end;

initialization
  PressXCLForm(TCustomQueryPresenter, TCustomQueryForm);

end.

