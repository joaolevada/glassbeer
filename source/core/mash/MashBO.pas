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
    function GetAmount: Double;
    function GetAverageFinalGravity: Double;
    function GetAverageOriginalGravity: Double;
    procedure SetAmount(const AValue: Double);
    procedure SetAverageFinalGravity(const AValue: Double);
    procedure SetAverageOriginalGravity(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property Amount: Double read GetAmount write SetAmount;
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
    function GetVolume: Double;
    procedure SetOriginalGravity(const AValue: Double);
    procedure SetVolume(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
  published
    property OriginalGravity: Double read GetOriginalGravity
      write SetOriginalGravity;
    property Volume: Double read GetVolume write SetVolume;
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

  { TMashQuery }

  TMashQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMashFermenterItem }

  TMashFermenterItem = class(TCustomObject)
    _Fermenter: TFermenterReference;
    _Volume: TPressDouble;
    _FermenterEvents: TFermenterEventItemParts;
    _StartDate: TPressDate;
    _DaysSinceStart: TPressInteger;
    _DaysSinceLastEvent: TPressInteger;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMashFermenterItemParts }

  TMashFermenterItemParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;


implementation

{ TMashQuery }

class function TMashQuery.InternalMetadataStr: string;
begin
  Result := 'TMashQuery(TMash) (' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    ')';
end;

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
  Result := 'TMashIngredientItem IsPersistent PersistentName="MshIgrdIt" (' +
    'RawMaterial: TRawMaterialReference ShortName="RawMtrl";' +
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

{ TMashItem }

function TMashItem.GetOriginalGravity: Double;
begin
  Result := _OriginalGravity.Value;
end;

function TMashItem.GetVolume: Double;
begin
  Result := _Volume.Value;
end;

procedure TMashItem.SetOriginalGravity(const AValue: Double);
begin
  _OriginalGravity.Value := AValue;
end;

procedure TMashItem.SetVolume(const AValue: Double);
begin
  _Volume.Value := AValue;;
end;

class function TMashItem.InternalMetadataStr: string;
begin
  Result := 'TMashItem IsPersistent PersistentName="MshIt" (' +
    'Recipe: TRecipeReference;' +
    'Volume: Double;' +
    'OriginalGravity: Double;' +
    'MashIngredients: TMashIngredientItemParts ShortName="MshIngds";' +
    ')';
end;

{ TMash }

function TMash.GetAmount: Double;
begin
  Result := _Amount.Value;
end;

function TMash.GetAverageFinalGravity: Double;
begin
  Result := _FinalGravity.Value;
end;

function TMash.GetAverageOriginalGravity: Double;
begin
  Result := _AverageOriginalGravity.Value;
end;

procedure TMash.SetAmount(const AValue: Double);
begin
  _Amount.Value := AValue;
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
    'BasicUserRecordData: TBasicUserRecordDataPart ShortName="BasicURD";' +
    'MashItems: TMashItemParts;' +
    'AverageOriginalGravity: Double Calc(MashItems);' +
    'FinalGravity: Double;' +
    'Amount: Double Calc(MashItems);' +
    'Fermenters: TMashFermenterItemParts ShortName="Fmts";' +
    ')';
end;

procedure TMash.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  VAvg: Double;
  VSum: Double;
  I: Integer;
begin
  if AAttribute = _Amount then
  begin
    VSum := 0;
    for I := 0 to Pred(_MashItems.Count) do
      VSum += (_MashItems[I] as TMashItem).Volume;
    Amount := VSum;
  end
  else if AAttribute = _AverageOriginalGravity then
  begin
    VSum := 0;
    for I := 0 to Pred(_MashItems.Count) do
      VSum += (_MashItems[I] as TMashItem).OriginalGravity;
    VAvg := VSum / _MashItems.Count;
    AverageOriginalGravity := VAvg;
  end;
end;

{ TMashFermenterItem }

class function TMashFermenterItem.InternalMetadataStr: string;
begin
  Result := 'TMashFermenterItem IsPersistent PersistentName="MsFmtIt" (' +
    'Fermenter: TFermenterReference ShortName="Fmt";' +
    'Volume: Double;' +
    'FermenterEvents: TFermenterEventItemParts ShortName="FmtEvts";' +
    'StartDate: Date;' +
    'DaysSinceStart: Integer Calc(StartDate);' +
    'DaysSinceLastEvent: Integer Calc(FermenterEvents);' +
    ')';
end;


initialization
  TMash.RegisterClass;
  TMashFermenterItem.RegisterClass;
  TMashFermenterItemParts.RegisterAttribute;
  TMashIngredientItem.RegisterClass;
  TMashIngredientItemParts.RegisterAttribute;
  TMashItem.RegisterClass;
  TMashItemParts.RegisterAttribute;
  TMashQuery.RegisterClass;
  TMashReference.RegisterAttribute;

finalization
  TMash.UnregisterClass;
  TMashFermenterItem.UnregisterClass;
  TMashFermenterItemParts.UnregisterAttribute;
  TMashIngredientItem.UnregisterClass;
  TMashIngredientItemParts.UnregisterAttribute;
  TMashItem.UnregisterClass;
  TMashItemParts.UnregisterAttribute;
  TMashQuery.UnregisterClass;
  TMashReference.UnregisterAttribute;

end.

