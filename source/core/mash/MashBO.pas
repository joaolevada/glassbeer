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
    _Code: TPressPlainsString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
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
    property MashItems: TMashItemParts read _MashItems write _MashItems;
  end;

  { TMashItem }

  TMashItem = class(TCustomObject)
    _Recipe: TReference;
    _Volume: TPressDouble;
    _OriginalGravity: TPressDouble;
    _MashIngredients: TMashIngredientItemParts;
    _TemperatureLog: TPressParts;
    _GravityLog: TPressParts;
    _StartWater: TPressDouble;
    _SpargeWater: TPressDouble;
    _TotalWater: TPressDouble;
    _BoilTime: TPressDouble;
    _GeneralLog: TPressParts;
    _VolumePretty: TPressPlainString;
  private
    function GetBoilTime: Double;
    function GetOriginalGravity: Double;
    function GetSpargeWater: Double;
    function GetStartWater: Double;
    function GetTotalWater: Double;
    function GetVolume: Double;
    function GetVolumePretty: string;
    procedure SetBoilTime(AValue: Double);
    procedure SetOriginalGravity(const AValue: Double);
    procedure SetSpargeWater(AValue: Double);
    procedure SetStartWater(AValue: Double);
    procedure SetTotalWater(AValue: Double);
    procedure SetVolume(const AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property OriginalGravity: Double read GetOriginalGravity
      write SetOriginalGravity;
    property Volume: Double read GetVolume write SetVolume;
    property StartWater: Double read GetStartWater write SetStartWater;
    property SpargeWater: Double read GetSpargeWater write SetSpargeWater;
    property TotalWater: Double read GetTotalWater write SetTotalWater;
    property BoilTime: Double read GetBoilTime write SetBoilTime;
    property VolumePretty: string read GetVolumePretty;
  end;

  { TMashIngredientItem }

  TMashIngredientItem = class(TCustomObject)
    _Product: TReference;
    _Quantity: TPressDouble;
    _Unity: TPressEnum;
  private
    function GetUnity: TUnity;
    procedure SetUnity(AValue: TUnity);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  published
    property Unity: TUnity read GetUnity write SetUnity;
  end;

  { TMashQuery }

  TMashQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMashFermenterItem }

  TMashFermenterItem = class(TCustomObject)
    _Fermenter: TPressReference;
    _Volume: TPressDouble;
    _FermenterEvents: TFermenterEventItemParts;
    _StartDate: TPressDate;
    _DaysSinceStart: TPressInteger;
    _DaysSinceLastEvent: TPressInteger;
  protected
    class function InternalMetadataStr: string; override;
  end;


implementation

{ TMashQuery }

class function TMashQuery.InternalMetadataStr: string;
begin
  Result := 'TMashQuery(TMash) (' +
    'Name: AnsiString(40) MatchType=mtContains;' +
    ')';
end;

{ TMashIngredientItemParts }

class function TMashIngredientItemParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TMashIngredientItem;
end;

{ TMashIngredientItem }

function TMashIngredientItem.GetUnity: TUnity;
begin
  Result := TUnity(_Unity.Value);
end;

procedure TMashIngredientItem.SetUnity(AValue: TUnity);
begin
  _Unity.Value := Integer(AValue);
end;

class function TMashIngredientItem.InternalMetadataStr: string;
begin
  Result := 'TMashIngredientItem IsPersistent PersistentName="MshIgrdIt" (' +
    'Product: Reference(TProduct);' +
    'Quantity: Double;' +
    'Unity: Enum(TUnity) Calc(RawMaterial) IsPersistent=False;' +
    ')';
end;

procedure TMashIngredientItem.InternalCalcAttribute(AAttribute: TPressAttribute
  );
var
  VRawMaterial: TRawMaterial;
begin
  if AAttribute = _Unity then
  begin
    VRawMaterial := _RawMaterial.Value as TRawMaterial;
    if Assigned(VRawMaterial) and not VRawMaterial._Unity.IsEmpty then
      _Unity.Value := VRawMaterial._Unity.Value
    else
      _Unity.Clear;
  end;
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

function TMashItem.GetBoilTime: Double;
begin
  Result := _BoilTime.Value;
end;

function TMashItem.GetOriginalGravity: Double;
begin
  Result := _OriginalGravity.Value;
end;

function TMashItem.GetSpargeWater: Double;
begin
  Result := _SpargeWater.Value;
end;

function TMashItem.GetStartWater: Double;
begin
  Result := _StartWater.Value;
end;

function TMashItem.GetTotalWater: Double;
begin
  Result := _TotalWater.Value;
end;

function TMashItem.GetVolume: Double;
begin
  Result := _Volume.Value;
end;

function TMashItem.GetVolumePretty: string;
const
  CLiters = '%.2f litro(s)';
begin
  Result := Format(CLiters, [Volume]);
end;

procedure TMashItem.SetBoilTime(AValue: Double);
begin
  _BoilTime.Value := AValue;
end;

procedure TMashItem.SetOriginalGravity(const AValue: Double);
begin
  _OriginalGravity.Value := AValue;
end;

procedure TMashItem.SetSpargeWater(AValue: Double);
begin
  _SpargeWater.Value := AValue;
end;

procedure TMashItem.SetStartWater(AValue: Double);
begin
  _StartWater.Value := AValue;
end;

procedure TMashItem.SetTotalWater(AValue: Double);
begin
  _TotalWater.Value := AValue;
end;

procedure TMashItem.SetVolume(const AValue: Double);
begin
  _Volume.Value := AValue;;
end;

class function TMashItem.InternalMetadataStr: string;
begin
  Result := 'TMashItem IsPersistent PersistentName="MshIt" (' +
    'Recipe: Reference(TRecipe);' +
    'Volume: Double;' +
    'OriginalGravity: Double;' +
    'MashIngredients: TMashIngredientItemParts ShortName="MshIngds";' +
    'TemperatureLog: Parts(TMashItemTemperature) ShortName="TempLog";' +
    'GravityLog: Parts(TMashItemGravity) ShortName="GravLog";' +
    'StartWater: Double;' +
    'SpargeWater: Double;' +
    'TotalWater: Double Calc(StartWater,SpargeWater);' +
    'BoilTime: Double;' +
    'GeneralLog: Parts(TGeneralLog);' +
    'VolumePretty: PlainString(20) IsPersistent=False;' +
    ')';
end;

procedure TMashItem.InternalCalcAttribute(AAttribute: TPressAttribute);
begin
  if AAttribute = _TotalWater then
    TotalWater := StartWater + SpargeWater;
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
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    'MashItems: TMashItemParts;' +
    'AverageOriginalGravity: Double Calc(MashItems);' +
    'FinalGravity: Double;' +
    'Amount: Double Calc(MashItems);' +
    'Fermenters: TMashFermenterItemParts ShortName="Fmts";' +
    ')';
end;

procedure TMash.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  VAverage: Double;
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
    for I := 0 to Pred(MashItems.Count) do
      VSum += (MashItems[I] as TMashItem).OriginalGravity;
    if MashItems.Count > 0 then
      VAverage := VSum / MashItems.Count
    else
      VAverage := 0;
    AverageOriginalGravity := VAverage;
  end;
end;

{ TMashFermenterItem }

class function TMashFermenterItem.InternalMetadataStr: string;
begin
  Result := 'TMashFermenterItem IsPersistent PersistentName="MsFmtIt" (' +
    'Fermenter: Reference(TFermenter) ShortName="Fmt";' +
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
  TMashIngredientItem.RegisterClass;
  TMashItem.RegisterClass;
  TMashQuery.RegisterClass;

finalization
  TMash.UnregisterClass;
  TMashFermenterItem.UnregisterClass;
  TMashIngredientItem.UnregisterClass;
  TMashItem.UnregisterClass;
  TMashItemParts.UnregisterAttribute;
  TMashQuery.UnregisterClass;

end.

