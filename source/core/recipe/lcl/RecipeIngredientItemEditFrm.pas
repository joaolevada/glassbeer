unit RecipeIngredientItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TRecipeIngredientItemEditForm }

  TRecipeIngredientItemEditForm = class(TCustomEditForm)
    PercentageEdit: TEdit;
    PercentageLabel: TLabel;
    RawMaterialCombo: TComboBox;
    RawMaterialLabel: TLabel;
    AddRawMaterialSpeedButton: TSpeedButton;
    EditRawMaterialSpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  PressXCLBroker,
  RecipeMVP,
  MainFrm;

{ TRecipeIngredientItemEditForm }

constructor TRecipeIngredientItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddRawMaterialSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditRawMaterialSpeedButton.Glyph);
end;

{$R *.lfm}


initialization
  PressXCLForm(TRecipeIngredientItemEditPresenter,
    TRecipeIngredientItemEditForm);


end.

