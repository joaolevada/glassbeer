unit RecipeBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressAttributes,
  PressSubject,
  CustomBO;

type
  TRecipe = class(TCustomObject)

  end;

  TRecipeIngredientItem = class(TCustomObject)
  end;

  TRecipeIngredientItemParts = class(TCustomParts)

  end;

implementation

initialization
  TRecipe.RegisterClass;
  TRecipeIngredientItem.RegisterClass;
  TRecipeIngredientItemParts.RegisterAttribute;

finalization
  TRecipe.UnregisterClass;
  TRecipeIngredientItem.UnregisterClass;
  TRecipeIngredientItemParts.UnregisterAttribute;

end.

