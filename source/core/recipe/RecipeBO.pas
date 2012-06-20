unit RecipeBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes
  ,SysUtils
  ,PressAttributes
  ,PressSubject
  ,CustomBO
  ,BasicUserRecordDataBO;

type

  {$M+}
  TBeerStyleReferences = class;
  TRecipeIngredientItemParts = class;
  {$M-}

  TBeerFamily = (bfAle, bfLager, bfLambic);

  { TRecipe }

  TRecipe = class(TCustomObject)
  	_BasicUserRecordData: TBasicUserRecordDataPart;
  	_Family: TPressEnum;
  	_Ingredients: TRecipeIngredientItemParts;
  	_Water: TPressDouble;
  	_Styles: TBeerStyleReferences;
  	_OriginalGravity: TPressDouble;
  	_FinalGravity: TPressDouble;
  private
    function GetCode: string;
    function GetFamily: TBeerFamily;
    function GetFinalGravity: Double;
    function GetIngredients: TRecipeIngredientItemParts;
    function GetName: string;
    function GetOriginalGravity: Double;
    function GetRemarks: string;
    function GetStyles: TBeerStyleReferences;
    function GetWater: Double;
    procedure SetCode(const AValue: string);
    procedure SetFamily(const AValue: TBeerFamily);
    procedure SetFinalGravity(const AValue: Double);
    procedure SetIngredients(const AValue: TRecipeIngredientItemParts);
    procedure SetName(const AValue: string);
    procedure SetOriginalGravity(const AValue: Double);
    procedure SetRemarks(const AValue: string);
    procedure SetStyles(const AValue: TBeerStyleReferences);
    procedure SetWater(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
  published
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemarks write SetRemarks;
    property Family: TBeerFamily read GetFamily write SetFamily;
    property Ingredients: TRecipeIngredientItemParts read GetIngredients write SetIngredients;
    property Water: Double read GetWater write SetWater;
    property Styles: TBeerStyleReferences read GetStyles write SetStyles;
    property OriginalGravity: Double read GetOriginalGravity write SetOriginalGravity;
    property FinalGravity: Double read GetFinalGravity write SetFinalGravity;
  end;

  TRecipeIngredientItem = class(TCustomObject)
  end;

  TRecipeIngredientItemParts = class(TCustomParts)
  end;

  TBeerStyleReferences = class(TCustomReferences)
  end;


implementation


{ TRecipe }

function TRecipe.GetCode: string;
begin

end;

function TRecipe.GetFamily: TBeerFamily;
begin

end;

function TRecipe.GetFinalGravity: Double;
begin

end;

function TRecipe.GetIngredients: TRecipeIngredientItemParts;
begin

end;

function TRecipe.GetName: string;
begin

end;

function TRecipe.GetOriginalGravity: Double;
begin

end;

function TRecipe.GetRemarks: string;
begin

end;

function TRecipe.GetStyles: TBeerStyleReferences;
begin

end;

function TRecipe.GetWater: Double;
begin

end;

procedure TRecipe.SetCode(const AValue: string);
begin

end;

procedure TRecipe.SetFamily(const AValue: TBeerFamily);
begin

end;

procedure TRecipe.SetFinalGravity(const AValue: Double);
begin

end;

procedure TRecipe.SetIngredients(const AValue: TRecipeIngredientItemParts);
begin

end;

procedure TRecipe.SetName(const AValue: string);
begin

end;

procedure TRecipe.SetOriginalGravity(const AValue: Double);
begin

end;

procedure TRecipe.SetRemarks(const AValue: string);
begin

end;

procedure TRecipe.SetStyles(const AValue: TBeerStyleReferences);
begin

end;

procedure TRecipe.SetWater(const AValue: Double);
begin

end;

class function TRecipe.InternalMetadataStr: string;
begin
  Result:=inherited InternalMetadataStr;
end;

initialization
  TRecipe.RegisterClass;
  TRecipeIngredientItem.RegisterClass;
  TRecipeIngredientItemParts.RegisterAttribute;

finalization
  TRecipe.UnregisterClass;
  TRecipeIngredientItem.UnregisterClass;
  TRecipeIngredientItemParts.UnregisterAttribute;

end.

