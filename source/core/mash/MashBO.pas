unit MashBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressAttributes,
  CustomBO,
  BasicUserRecordDataBO,
  PressSubject,
  RecipeBO,
  RawMaterialBO,
  FermenterBO;

type

  {$M+}
  TMashItemParts = class;
  TMashFermenterItemParts = class;
  TMashIngredientItemParts = class;
  {$M-}

  { TMash }

  TMash = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _MashItems: TMashItemParts;
    _AverageOriginalGravity: TPressDouble;
    _FinalGravity: TPressDouble;
    _Amount: TPressDouble;
    _Fermenters: TMashFermenterItemParts;
  private
    function GetAverageFinalGravity: Double;
    function GetAverageOriginalGravity: Double;
    procedure SetAverageFinalGravity(const AValue: Double);
    procedure SetAverageOriginalGravity(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property AverageFinalGravity: Double read GetAverageFinalGravity
      write SetAverageFinalGravity;
    property AverageOriginalGravity: Double read GetAverageOriginalGravity
      write SetAverageOriginalGravity;
  end;

  { TMashItemParts }

  TMashItemParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  { TMashFermenterItemParts }

  TMashFermenterItemParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  { TMashReference }

  TMashReference = class(TCustomReference)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  { TMashItem }

  TMashItem = class(TCustomObject)
    _Recipe: TRecipeReference;
    _Volume: TPressDouble;
    _OriginalGravity: TPressDouble;
    _MashIngredients: TMashIngredientItemParts;
  private
    function GetOriginalGravity: Double;
    procedure SetOriginalGravity(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
  published
    property OriginalGravity: Double read GetOriginalGravity
      write SetOriginalGravity;
  end;

  { TMashFermenterItem }

  TMashFermenterItem = class(TCustomObject)
    _Fermenter: TFermenterReference;
    _Volume: TPressDouble;
    _StartDate: TPressDate;
    _DaysSinceStart: TPressInteger;
    _DaysSinceLastEvent: TPressInteger;
    _FermenterEvents: TFermenterEventItemParts;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMashIngredientItem }

  TMashIngredientItem = class(TCustomObject)
    _RawMaterial: TRawMaterialReference;
    _Quantity: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMashIngredientItemParts }

  TMashIngredientItemParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  { TMashFermenterItemReferences }

  TMashFermenterItemReferences = class(TCustomReferences)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;


implementation

{ TMashFermenterItemReferences }

class function TMashFermenterItemReferences.ValidObjectClass: TPressObjectClass;
begin
  Result := TMashFermenterItem;
end;

{ TMashIngredientItemParts }

class function TMashIngredientItemParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TMashIngredientItem;
end;

{ TMashIngredientItem }

class function TMashIngredientItem.InternalMetadataStr: string;
begin
  Result := 'TMashIngredientItem IsPersistent (' +
    'RawMaterial: TRawMaterialReference;' +
    'Quantity: Double;' +
    ')';
end;

{ TMashReference }

class function TMashReference.ValidObjectClass: TPressObjectClass;
begin
  Result := TMash;
end;

{ TMashFermenterItemParts }

class function TMashFermenterItemParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TMashFermenterItem;
end;

{ TMashItemParts }

class function TMashItemParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TMashItem;
end;

{ TMashFermenterItem }

class function TMashFermenterItem.InternalMetadataStr: string;
begin
  Result := 'TMashFermenterItem IsPersistent(' +
    'Fermenter: TFermenterReference;' +
    'Volume: Double;' +
    'StartDate: Date;' +
    'DaysSinceStart: Integer Calc(FermenterEvents);' +
    'DaysSinceLastEvent: Integer Calc(FermenterEvents);' +
    'FermenterEvents: TFermenterEventItemParts;' +
    ')';
end;

{ TMashItem }

function TMashItem.GetOriginalGravity: Double;
begin
  Result := _OriginalGravity.Value;
end;

procedure TMashItem.SetOriginalGravity(const AValue: Double);
begin
  _OriginalGravity.Value := AValue;
end;

class function TMashItem.InternalMetadataStr: string;
begin
  Result := 'TMashItem IsPersistent (' +
    'Recipe: TRecipeReference;' +
    'Volume: Double;' +
    'OriginalGravity: Double;' +
    'MashIngredients: TMashIngredientItemParts;' +
    ')';
end;

{ TMash }

function TMash.GetAverageFinalGravity: Double;
begin
  Result := _FinalGravity.Value;
end;

function TMash.GetAverageOriginalGravity: Double;
begin
  Result := _AverageOriginalGravity.Value;
end;

procedure TMash.SetAverageFinalGravity(const AValue: Double);
begin
  _FinalGravity.Value := AValue;
end;

procedure TMash.SetAverageOriginalGravity(const AValue: Double);
begin
  _AverageOriginalGravity.Value := AValue;
end;

class function TMash.InternalMetadataStr: string;
begin
  Result := 'TMash IsPersistent (' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    'MashItems: TMashItemParts;' +
    'AverageOriginalGravity: Double Calc(MashItems);' +
    'FinalGravity: Double;' +
    'Amount: Double Calc(MashItems);' +
    'Fermenters: TMashFermenterItemParts;' +
    ')';
end;

procedure TMash.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  VAvg: Double;
  VSum: Double;
  I: Integer;
begin
  if AAttribute = _AverageOriginalGravity then
  begin
    VSum := 0;
    for I := 0 to Pred(_MashItems.Count) do
      VSum += (_MashItems[I] as TMashItem).OriginalGravity;
    VAvg := VSum / _MashItems.Count;
    AverageOriginalGravity := VAvg;
  end;
end;

initialization
  TMash.RegisterClass;
  TMashFermenterItem.RegisterClass;
  TMashFermenterItemReferences.RegisterAttribute;
  TMashIngredientItem.RegisterClass;
  TMashIngredientItemParts.RegisterAttribute;
  TMashItem.RegisterClass;
  TMashItemParts.RegisterAttribute;
  TMashFermenterItemParts.RegisterAttribute;
  TMashReference.RegisterAttribute;

finalization
  TMash.UnregisterClass;
  TMashFermenterItem.UnregisterClass;
  TMashFermenterItemReferences.UnregisterAttribute;
  TMashIngredientItem.UnregisterClass;
  TMashIngredientItemParts.UnregisterAttribute;
  TMashItem.UnregisterClass;
  TMashItemParts.UnregisterAttribute;
  TMashFermenterItemParts.UnregisterAttribute;
  TMashReference.UnregisterAttribute;

end.

