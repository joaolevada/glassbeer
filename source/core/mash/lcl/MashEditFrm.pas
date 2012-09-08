unit MashEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashEditForm }

  TMashEditForm = class(TCustomEditForm)
    AddFermenterSpeedButton: TSpeedButton;
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    AverageOriginalGravityLabel: TLabel;
    AverageOriginalGravityEdit: TEdit;
    AmountEdit: TEdit;
    EditFermenterSpeedButton: TSpeedButton;
    FinalGravityEdit: TEdit;
    FinalGravityLabel: TLabel;
    AmountLabel: TLabel;
    FermentersLabel: TLabel;
    MashItemsLabel: TLabel;
    RemaksLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    MashItemsTab: TTabSheet;
    RemarksMemo: TMemo;
    MashItemsStringGrid: TStringGrid;
    FermentersTab: TTabSheet;
    FermentersStringGrid: TStringGrid;
    AddMashItemSpeedButton: TSpeedButton;
    EditMashItemSpeedButton: TSpeedButton;
    RemoveMashItemSpeedButton: TSpeedButton;
    RemoveFermenterSpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP,
  MainFrm;

{ TMashEditForm }

constructor TMashEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddMashItemSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditMashItemSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveMashItemSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddFermenterSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditFermenterSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveFermenterSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashEditPresenter, TMashEditForm);

end.

