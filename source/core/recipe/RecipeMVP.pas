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
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TRecipeIngredientItemPresenter }

  TRecipeIngredientItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  RecipeBO,
  PressMVPPresenter,
  PressMVPCommand;

{ TRecipeQueryPresenter }

procedure TRecipeQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TRecipeQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(198, "Código");' +
    'Name(356, "Descrição");' +
    'Family(198, "Família");' +
    'AgeFor(198, "Maturação [dias]")';
end;

{ TRecipeEditPresenter }

procedure TRecipeEditPresenter.InitPresenter;
var
  VIngredientsPresenter: TPressMVPItemsPresenter;
  VIngredientPresenter: TPressMVPFormPresenter;
  VIngredientProductPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('AgeFor', 'AgeForEdit');
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Family', 'FamilyComboBox');
  VIngredientsPresenter := CreateSubPresenter('Ingredients',
    'IngredientsStringGrid',
    'Product.Name(356, "Produto/matéria prima");' +
    'Percentage(198,"Porcentagem")') as TPressMVPItemsPresenter;
  VIngredientsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddIngredientSpeedButton');
  VIngredientsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditIngredientSpeedButton');
  VIngredientsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveIngredientSpeedButton');
  VIngredientPresenter := CreateDetailPresenter(VIngredientsPresenter);
  VIngredientProductPresenter := VIngredientPresenter.CreateSubPresenter('Product', 'IngredientProductComboBox',
    'Name');
  VIngredientProductPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddIngredientProductSpeedButton');
  VIngredientProductPresenter.BindCommand(TPressMVPEditItemCommand, 'EditIngredientProductSpeedButton');
  VIngredientPresenter.CreateSubPresenter('Percentage', 'IngredientPercentageEdit');
  CreateSubPresenter('WaterAmount', 'WaterAmountEdit');
  CreateSubPresenter('OriginalGravity', 'OriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
end;


{ TRecipeIngredientItemEditPresenter }

procedure TRecipeIngredientItemEditPresenter.InitPresenter;
var
  VProductPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VProductPresenter := CreateSubPresenter('Product', 'ProductComboBox',
    'Name');
  VProductPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddProductSpeedButton');
  VProductPresenter.BindCommand(TPressMVPEditItemCommand, 'EditProductSpeedButton');
  CreateSubPresenter('Percentage', 'PercentageEdit');
end;

initialization
  TRecipeEditPresenter.RegisterBO(TRecipe);
  TRecipeIngredientItemEditPresenter.RegisterBO(TRecipeIngredientItem);
  TRecipeQueryPresenter.RegisterBO(TRecipeQuery);


end.

