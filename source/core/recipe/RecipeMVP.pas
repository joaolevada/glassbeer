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
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Descrição");' +
    'Family(198, "Família");' +
    'AgeFor(198, "Maturação (dias)")';
end;

{ TRecipeEditPresenter }

procedure TRecipeEditPresenter.InitPresenter;
var
  VIngredientsPresenter: TPressMVPItemsPresenter;
  VIngredientPresenter: TPressMVPFormPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('AgeFor', 'AgeForEdit');
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('Family', 'FamilyCombo');
  VIngredientsPresenter := CreateSubPresenter('Ingredients',
    'IngredientsStringGrid',
    'RawMaterial.BasicUserRecordData.Name(356, "Matéria prima");' +
    'Percentage(198,"Porcentagem")') as TPressMVPItemsPresenter;
  VIngredientsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddIngredientSpeedButton');
  VIngredientsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditIngredientSpeedButton');
  VIngredientsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveIngredientSpeedButton');
  VIngredientPresenter := CreateDetailPresenter(VIngredientsPresenter);
  VIngredientPresenter.CreateSubPresenter('RawMaterial', 'RawMaterialCombo',
    'BasicUserRecordData.Name');
  VIngredientPresenter.CreateSubPresenter('Percentage', 'PercentageEdit');
  CreateSubPresenter('WaterAmount', 'WaterAmountEdit');
  CreateSubPresenter('OriginalGravity', 'OriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
end;


{ TRecipeIngredientItemEditPresenter }

procedure TRecipeIngredientItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RawMaterial', 'RawMaterialCombo',
    'BasicUserRecordData.Name');
  CreateSubPresenter('Percentage', 'PercentageEdit');
end;

initialization
  TRecipeEditPresenter.RegisterBO(TRecipe);
  TRecipeIngredientItemEditPresenter.RegisterBO(TRecipeIngredientItem);
  TRecipeQueryPresenter.RegisterBO(TRecipeQuery);


end.

