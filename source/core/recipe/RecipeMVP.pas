unit RecipeMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP
  ,PressXCLBroker;

type

  { TRecipeEditPresenter }

  TRecipeEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TRecipeQueryPresenter }

  TRecipeQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TRecipeIngredientItemPresenter }

  TRecipeIngredientItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  RecipeBO;

{ TRecipeQueryPresenter }

procedure TRecipeQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

{ TRecipeEditPresenter }

procedure TRecipeEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('AgeFor', 'AgeForEdit');
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Family', 'FamilyCombo');
  CreateSubPresenter('Ingredients', 'IngredientsGrid');
  CreateSubPresenter('WaterAmount', 'WaterAmountEdit');
  CreateSubPresenter('OriginalGravity', 'OriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
end;


{ TRecipeIngredientItemEditPresenter }

procedure TRecipeIngredientItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RawMaterial', 'RawMaterialCombo', 'RawMaterial.Name');
  CreateSubPresenter('Percentage', 'PercentageEdit');
end;

initialization
  TRecipeEditPresenter.RegisterBO(TRecipe);
  TRecipeIngredientItemEditPresenter.RegisterBO(TRecipeIngredientItem);
  TRecipeQueryPresenter.RegisterBO(TRecipeQuery);


end.

