unit RecipeEditFrm; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TRecipeEditForm }

  TRecipeEditForm = class(TCustomEditForm)
    AddIngredientProductSpeedButton: TSpeedButton;
    AddIngredientSpeedButton: TSpeedButton;
    CodeEdit: TEdit;
    EditIngredientProductSpeedButton: TSpeedButton;
    EditIngredientSpeedButton: TSpeedButton;
    IngredientItemGroupBox: TGroupBox;
    FinalGravityEdit: TEdit;
    FinalGravityLabel: TLabel;
    IngredientPercentageEdit: TEdit;
    IngredientProductComboBox: TComboBox;
    IngredientsLabel: TLabel;
    OriginalGravityEdit: TEdit;
    OriginalGravityLabel: TLabel;
    IngredientsStringGrid: TStringGrid;
    IngredientPercentageLabel: TLabel;
    IngredientProductLabel: TLabel;
    RemoveIngredientSpeedButton: TSpeedButton;
    WaterAmountEdit: TEdit;
    CodeLabel: TLabel;
    AgeForEdit: TEdit;
    WaterAmountLabel: TLabel;
    FamilyComboBox: TComboBox;
    FamilyLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    IngredientsTab: TTabSheet;
    AgeForLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  PressXCLBroker,
  RecipeMVP,
  MainFrm;

{ TRecipeEditForm }

constructor TRecipeEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveIngredientSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddIngredientProductSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditIngredientProductSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TRecipeEditPresenter,TRecipeEditForm);

{$R *.lfm}

end.

