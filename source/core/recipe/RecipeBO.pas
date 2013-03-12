unit RecipeBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes
  ,SysUtils
  ,PressAttributes
  ,PressSubject
  ,CustomBO
  ,BasicUserRecordDataBO
  ,RawMaterialBO;

type

  {$M+}
  TRecipeIngredientItemParts = class;
  {$M-}

  TBeerFamily = (bfAle, bfLager, bfLambic);

  { TRecipe }

  TRecipe = class(TCustomObject)
  	_Code: TPressPlainsString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
  	_Family: TPressEnum;
  	_Ingredients: TRecipeIngredientItemParts;
  	_WaterAmount: TPressDouble;
  	_OriginalGravity: TPressDouble;
  	_FinalGravity: TPressDouble;
    _AgeFor: TPressInteger;
  private
    function GetAgeFor: integer;
    function GetCode: string;
    function GetFamily: TBeerFamily;
    function GetFinalGravity: Double;
    function GetName: string;
    function GetOriginalGravity: Double;
    function GetRemarks: string;
    function GetWaterAmount: Double;
    procedure SetAgeFor(const AValue: integer);
    procedure SetCode(const AValue: string);
    procedure SetFamily(const AValue: TBeerFamily);
    procedure SetFinalGravity(const AValue: Double);
    procedure SetName(const AValue: string);
    procedure SetOriginalGravity(const AValue: Double);
    procedure SetRemarks(const AValue: string);
    procedure SetWaterAmount(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
  published
    property AgeFor: integer read GetAgeFor write SetAgeFor;
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemarks write SetRemarks;
    property Family: TBeerFamily read GetFamily write SetFamily;
    property WaterAmount: Double read GetWaterAmount write SetWaterAmount;
    property OriginalGravity: Double read GetOriginalGravity write SetOriginalGravity;
    property FinalGravity: Double read GetFinalGravity write SetFinalGravity;
  end;

  { TRecipeIngredientItem }

  TRecipeIngredientItem = class(TCustomObject)
    _Product: TPressReference;
    _Percentage: TPressDouble;
  private
    function GetPercentage: Double;
    procedure SetPercentage(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
  published
    property Percentage: Double read GetPercentage write SetPercentage;
  end;

  { TRecipeQuery }

  TRecipeQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TRecipeQuery }

class function TRecipeQuery.InternalMetadataStr: string;
begin
  Result := 'TRecipeQuery(TRecipe) (' +
    'Name: AnsiString(40) MatchType=mtContains;' +
    ')';
end;


{ TRecipe }

function TRecipe.GetAgeFor: integer;
begin
  Result := _AgeFor.Value;
end;

function TRecipe.GetCode: string;
begin
  Result := TBasicUserRecordData(_BasicUserRecordData.Value).Code;
end;

function TRecipe.GetFamily: TBeerFamily;
begin
  Result := TBeerFamily(_Family.Value);
end;

function TRecipe.GetFinalGravity: Double;
begin
  Result := _FinalGravity.Value;
end;

function TRecipe.GetName: string;
begin
  Result := TBasicUserRecordData(_BasicUserRecordData.Value).Name;
end;

function TRecipe.GetOriginalGravity: Double;
begin
  Result := _OriginalGravity.Value;
end;

function TRecipe.GetRemarks: string;
begin
  Result := TBasicUserRecordData(_BasicUserRecordData.Value).Remarks;
end;

function TRecipe.GetWaterAmount: Double;
begin
  Result := _WaterAmount.Value;
end;

procedure TRecipe.SetAgeFor(const AValue: integer);
begin
  _AgeFor.Value := AValue;
end;

procedure TRecipe.SetCode(const AValue: string);
begin
  TBasicUserRecordData(_BasicUserRecordData.Value).Code := AValue;
end;

procedure TRecipe.SetFamily(const AValue: TBeerFamily);
begin
  _Family.Value := Integer(AValue);
end;

procedure TRecipe.SetFinalGravity(const AValue: Double);
begin
  _FinalGravity.Value := AValue;
end;

procedure TRecipe.SetName(const AValue: string);
begin
  TBasicUserRecordData(_BasicUserRecordData.Value).Name := AValue;
end;

procedure TRecipe.SetOriginalGravity(const AValue: Double);
begin
  _OriginalGravity.Value := AValue;
end;

procedure TRecipe.SetRemarks(const AValue: string);
begin
  TBasicUserRecordData(_BasicUserRecordData.Value).Remarks := AValue;
end;

procedure TRecipe.SetWaterAmount(const AValue: Double);
begin
  _WaterAmount.Value := AValue;
end;

class function TRecipe.InternalMetadataStr: string;
begin
  Result := 'TRecipe IsPersistent PersistentName="Recipe" (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    'Family: Enum(TBeerFamily) DisplayName="Família";' +
    'Ingredients: TRecipeIngredientItemParts ShortName="Ingrds";' +
    'WaterAmount: Double DisplayName="Volume de água (litros)";' +
    'OriginalGravity: Double DisplayName="Densidade original" Min=0 Max=2;' +
    'FinalGravity: Double DisplayName="Densidade final" Min=0 Max=2;' +
    'AgeFor: Integer DisplayName="Maturação";' +
    ')';
end;

{ TRecipeIngredientItem }

function TRecipeIngredientItem.GetPercentage: Double;
begin
  Result := _Percentage.Value;
end;

procedure TRecipeIngredientItem.SetPercentage(const AValue: Double);
begin
  _Percentage.Value := AValue;
end;

class function TRecipeIngredientItem.InternalMetadataStr: string;
begin
  Result := 'TRecipeIngredientItem IsPersistent PersistentName="RecIngItem" (' +
    'Product: Reference(TProduct) DisplayName="Produto/matéria prima";' +
    'Percentage: Double DisplayName="Porcentagem";' +
    ')';
end;

initialization
  PressModel.RegisterEnumMetadata(TypeInfo(TBeerFamily), 'TBeerFamily',
    [
    'Ale',
    'Lager',
    'Lambic'
    ]);
  TRecipe.RegisterClass;
  TRecipeIngredientItem.RegisterClass;
  TRecipeQuery.RegisterClass;

finalization
  TRecipe.UnregisterClass;
  TRecipeIngredientItem.UnregisterClass;
  TRecipeQuery.UnregisterClass;

end.

