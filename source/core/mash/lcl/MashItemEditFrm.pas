unit MashItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashItemEditForm }

  TMashItemEditForm = class(TCustomEditForm)
    MashIngredientsLabel: TLabel;
    OriginalGravityEdit: TEdit;
    OriginalGravityLabel: TLabel;
    MashIngredientsStringGrid: TStringGrid;
    AddMashIngredientSpeedButton: TSpeedButton;
    EditMashIngredientSpeedButton: TSpeedButton;
    RemoveMashIngredientSpeedButton: TSpeedButton;
    AddRecipeSpeedButton: TSpeedButton;
    EditRecipeSpeedButton: TSpeedButton;
    VolumeEdit: TEdit;
    VolumeLabel: TLabel;
    RecipeComboBox: TComboBox;
    RecipeLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP,
  MainFrm;

{ TMashItemEditForm }

constructor TMashItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddMashIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditMashIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveMashIngredientSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddRecipeSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditRecipeSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashItemEditPresenter, TMashItemEditForm);

end.

