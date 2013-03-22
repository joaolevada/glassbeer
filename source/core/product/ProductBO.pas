unit ProductBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  PressSubject,
  UnityBO;

type

  { TBudget }

  TBudget = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _Supplier: TPressReference;
    _Shipping: TPressCurrency;
    _SumOfItems: TPressCurrency;
    _TotalBudget: TPressCurrency;
    _Items: TPressParts;
    _Date: TPressDate;
    _ExpireDate: TPressDate;
    _ItemCount: TPressInteger;
    _WeightInKilograms: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  private
    function CountItems: Integer;
    function GetWeightInKilograms: Double;
    function GetItemCount: Integer;
    function GetShipping: Currency;
    function GetSumOfItems: Currency;
    function GetTotalBudget: Currency;
    procedure SetWeightInKilograms(AValue: Double);
    procedure SetItemCount(AValue: Integer);
    procedure SetShipping(AValue: Currency);
    procedure SetSumOfItems(AValue: Currency);
    procedure SetTotalBudget(AValue: Currency);
    function SumItemsValues: Currency;
    function SumItemsWeight: Double;
  public
    property WeightInKilograms: Double read GetWeightInKilograms
      write SetWeightInKilograms;
    property ItemCount: Integer read GetItemCount
      write SetItemCount;
    property Shipping: Currency read GetShipping write SetShipping;
    property SumOfItems: Currency read GetSumOfItems write SetSumOfItems;
    property TotalBudget: Currency read GetTotalBudget write SetTotalBudget;
  end;

  { TBudgetQuery }

  TBudgetQuery = class(TCustomQuery)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _MinDate: TPressDate;
    _MaxDate: TPressDate;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TBudgetItem }

  TBudgetItem = class(TCustomObject)
    _Product: TPressReference;
    _Unity: TPressReference;
    _Quantity: TPressDouble;
    _UnityValue: TPressCurrency;
    _TotalValue: TPressCurrency;
    _Shipping: TPressCurrency;
    _WeightInKilograms: TPressDouble;
  private
    function GetQuantity: Double;
    function GetShipping: Currency;
    function GetTotalValue: Currency;
    function GetUnity: TUnity;
    function GetUnityValue: Currency;
    function GetWeightInKilograms: Double;
    procedure SetQuantity(AValue: Double);
    procedure SetShipping(AValue: Currency);
    procedure SetTotalValue(AValue: Currency);
    procedure SetUnity(AValue: TUnity);
    procedure SetUnityValue(AValue: Currency);
    procedure SetWeightInKilograms(AValue: Double);
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  public
    property Quantity: Double read GetQuantity write SetQuantity;
    property Shipping: Currency read GetShipping write SetShipping;
    property TotalValue: Currency read GetTotalValue write SetTotalValue;
    //property Unity: TUnity read GetUnity write SetUnity;
    property UnityValue: Currency read GetUnityValue write SetUnityValue;
    property WeightInKilograms: Double read GetWeightInKilograms
      write SetWeightInKilograms;
  end;

  { TProduct }

  TProduct = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _Unity: TPressReference;
    _MinimumStock: TPressFloat;
    _MaximumStock: TPressFloat;
    _CurrentStock: TPressFloat;
    _Budgets: TPressReferences;
    _Invoices: TPressReferences;
    _Cost: TPressCurrency;
    _ProfitRate: TPressFloat;
    _CurrentStockCost: TPressCurrency;
    _Price: TPressCurrency;
    _CurrentStockPrice: TPressCurrency;
    _LastPurchaseDate: TPressDate;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TProductQuery }

  TProductQuery = class(TCustomQuery)
    _Code: TPressAnsiString;
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TInvoice }

  TInvoice = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _Supplier: TPressReference;
    _Shipping: TPressCurrency;
    _SumOfItems: TPressCurrency;
    _TotalInvoice: TPressCurrency;
    _Items: TPressParts;
    _Date: TPressDate;
    _ItemCount: TPressInteger;
    _ItemQuantity: TPressFloat;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TInvoiceQuery }

  TInvoiceQuery = class(TCustomQuery)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TInvoiceItem }

  TInvoiceItem = class(TCustomObject)
    _Product: TPressReference;
    _Unity: TPressReference;
    _Quantity: TPressDouble;
    _UnityValue: TPressCurrency;
    _TotalValue: TPressCurrency;
    _Shipping: TPressCurrency;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TBudgetQuery }

class function TBudgetQuery.InternalMetadataStr: string;
begin
  Result := 'TBudgetQuery (TBudget) (' +
    'Code: PlainString(20) MatchType=mtStarting;' +
    'Name: AnsiString(40) MatchType=mtContains;' +
    'MinDate: Date DataName=Date MatchType=mtGreaterThanOrEqual;' +
    'MaxDate: Date DataName=Date MatchType=mtLesserThanOrEqual' +
    ');'
end;

{ TInvoiceQuery }

class function TInvoiceQuery.InternalMetadataStr: string;
begin
  Result := 'TInvoiceQuery (TInvoice) (' +
    'Code: PlainString(20) MatchType=mtStarting;' +
    'Name: AnsiString(40) MatchType=mtContains' +
    ')';
end;

{ TProductQuery }

class function TProductQuery.InternalMetadataStr: string;
begin
  Result := 'TProductQuery (TProduct) (' +
    'Code: PlainString(20) MatchType=mtStarting;' +
    'Name: AnsiString(40) MatchType=mtContains' +
    ')';
end;

{ TInvoiceItem }

class function TInvoiceItem.InternalMetadataStr: string;
begin
  Result := 'TInvoiceItem IsPersistent(' +
    'Product: Reference(TProduct);' +
    'Unity: Reference(TUnity);' +
    'Quantity: Double;' +
    'UnityValue: Currency;' +
    'TotalValue: Currency;' +
    'Shipping: Currency' +
    ');';
end;

{ TInvoice }

class function TInvoice.InternalMetadataStr: string;
begin
  Result := 'TInvoice IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40) DisplayName="Nome" IsMandatory=True;' +
    'Remarks: Memo;' +
    'Supplier: Reference(TContact);' +
    'Shipping: Currency;' +
    'SumOfItems: Currency Calc(Items);' +
    'TotalInvoice: Currency Calc(SumOfItems, Shipping);' +
    'Items: Parts(TBudgetItem);' +
    'Date: Date DefaultValue="now";' +
    'ItemCount: Integer Calc(Items);' +
    'ItemQuantity: Double Calc(Items)' +
    ');';
end;

{ TBudgetItem }

function TBudgetItem.GetQuantity: Double;
begin
  Result := _Quantity.Value;
end;

function TBudgetItem.GetShipping: Currency;
begin
  Result := _Shipping.Value;
end;

function TBudgetItem.GetTotalValue: Currency;
begin
  Result := _TotalValue.Value;
end;

function TBudgetItem.GetUnity: TUnity;
begin
  Result := _Unity.Value as TUnity;
end;

function TBudgetItem.GetUnityValue: Currency;
begin
  Result := _UnityValue.Value;
end;

function TBudgetItem.GetWeightInKilograms: Double;
begin
  Result := _WeightInKilograms.Value;
end;

procedure TBudgetItem.SetQuantity(AValue: Double);
begin
  _Quantity.Value := AValue;
end;

procedure TBudgetItem.SetShipping(AValue: Currency);
begin
  _Shipping.Value := AValue;
end;

procedure TBudgetItem.SetTotalValue(AValue: Currency);
begin
  _TotalValue.Value := AValue;
end;

procedure TBudgetItem.SetUnity(AValue: TUnity);
begin
  _Unity.Value := AValue;
end;

procedure TBudgetItem.SetUnityValue(AValue: Currency);
begin
  _UnityValue.Value := AValue;
end;

procedure TBudgetItem.SetWeightInKilograms(AValue: Double);
begin
  _WeightInKilograms.Value := AValue;
end;

class function TBudgetItem.InternalMetadataStr: string;
begin
  Result := 'TBudgetItem IsPersistent(' +
    'Product: Reference(TProduct);' +
    'Unity: Reference(TUnity);' +
    'Quantity: Double;' +
    'UnityValue: Currency;' +
    'TotalValue: Currency Calc(Quantity, UnityValue);' +
    { calculated by owner (TBudget) }
    'Shipping: Currency;' +
    { calculated by owner (TBudget) }
    'WeightInKiloGrams: Double Calc(Unity, Quantity)' +
    ');';
end;

procedure TBudgetItem.InternalCalcAttribute(AAttribute: TPressAttribute);
begin
  if AAttribute = _TotalValue then
    TotalValue := UnityValue * Quantity
  else if (AAttribute = _WeightInKilograms) then
  begin
    { TODO 1 -ojoaolevada -cPress SDK bug : For some reason, PressObjects is rasing an exception here
it can't find the instace of TBudgetItem.Unity. So I've moved
this calculation to the TBudget class. }
    //if not _Unity.IsEmpty then
    //  WeightInKilograms := Quantity * (_Unity.Value as TUnity).WeightInKilograms;
  end;
end;

{ TBudget }

class function TBudget.InternalMetadataStr: string;
begin
  Result := 'TBudget IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40) DisplayName="Nome" IsMandatory=True;' +
    'Remarks: Memo;' +
    'Supplier: Reference(TContact);' +
    'Shipping: Currency;' +
    'SumOfItems: Currency Calc(Items);' +
    'TotalBudget: Currency Calc(SumOfItems, Shipping);' +
    'Items: Parts(TBudgetItem);' +
    'Date: Date DefaultValue="now";' +
    'ExpireDate: Date DefaultValue="now";' +
    'ItemCount: Integer Calc(Items);' +
    'WeightInKilograms: Double Calc(Items)' +
    ');';
end;

procedure TBudget.InternalCalcAttribute(AAttribute: TPressAttribute);
var
  I: Integer;
  VBudgetItem: TBudgetItem;
begin
  if AAttribute = _SumOfItems then
    SumOfItems := SumItemsValues
  else if AAttribute = _TotalBudget then
  begin
    TotalBudget := SumOfItems + Shipping;
    { ratio of shipping by item -> TBudgetItem.Shipping attribute }
    for I := 0 to Pred(_Items.Count) do
    begin
      VBudgetItem := _Items[I] as TBudgetItem;
      if (WeightInKilograms > 0) and (VBudgetItem.WeightInKilograms > 0) then
        VBudgetItem.Shipping := (Shipping / WeightInKilograms) * VBudgetItem.WeightInKilograms;
    end;
  end
  else if AAttribute = _ItemCount then
    ItemCount := CountItems
  else if AAttribute = _WeightInKilograms then
    WeightInKilograms := SumItemsWeight;
end;

function TBudget.CountItems: Integer;
begin
  Result := _Items.Count;
end;

function TBudget.GetWeightInKilograms: Double;
begin
  Result := _WeightInKilograms.Value;
end;

function TBudget.GetItemCount: Integer;
begin
  Result := _ItemCount.Value;
end;

function TBudget.GetShipping: Currency;
begin
  Result := _Shipping.Value;
end;

function TBudget.GetSumOfItems: Currency;
begin
  Result := _SumOfItems.Value;
end;

function TBudget.GetTotalBudget: Currency;
begin
  Result := _TotalBudget.Value;
end;

procedure TBudget.SetWeightInKilograms(AValue: Double);
begin
  _WeightInKilograms.Value:= AValue;
end;

procedure TBudget.SetItemCount(AValue: Integer);
begin
  _ItemCount.Value := AValue;
end;

procedure TBudget.SetShipping(AValue: Currency);
begin
  _Shipping.Value := AValue;
end;

procedure TBudget.SetSumOfItems(AValue: Currency);
begin
  _SumOfItems.Value := AValue;
end;

procedure TBudget.SetTotalBudget(AValue: Currency);
begin
  _TotalBudget.Value := AValue;
end;

function TBudget.SumItemsValues: Currency;
var
  i: Integer;
  VPartial: Currency;
  VBudgetItem: TBudgetItem;
begin
  VPartial := 0;
  for i := 0 to Pred(_Items.Count) do
  begin
    VBudgetItem := _Items[i] as TBudgetItem;
    VPartial += VBudgetItem.TotalValue;
  end;
  Result := VPartial;
end;

function TBudget.SumItemsWeight: Double;
var
  i: Integer;
  VPartial: Double;
  VBudgetItem: TBudgetItem;
  VUnity: TUnity;
begin
  VPartial := 0;
  for i := 0 to Pred(_Items.Count) do
  begin
    VBudgetItem := _Items[i] as TBudgetItem;
    if not VBudgetItem._Unity.IsEmpty then
    begin
      VUnity := VBudgetItem._Unity.Value as TUnity;
      VBudgetItem.WeightInKilograms := VBudgetItem.Quantity * VUnity.WeightInKilograms;
      VPartial += VBudgetItem.WeightInKilograms;
    end;
  end;
  Result := VPartial;
end;

{ TProduct }

class function TProduct.InternalMetadataStr: string;
begin
  Result := 'TProduct IsPersistent(' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40) DisplayName="Name" IsMandatory=True;' +
    'Remarks: Memo;' +
    'Unity: Reference(TUnity);' +
    'MinimumStock: Float;' +
    'MaximumStock: Float;' +
    'CurrentStock: Float;' +
    //'Budgets: References(TBudget);' +
    //'Invoices: References(TInvoice);' +
    'Cost: Currency;' +
    'ProfitRate: Float;' +
    'CurrentStockCost: Currency;' +
    'Price: Currency;' +
    'CurrentStockPrice: Currency;' +
    'LastPurchaseDate: Date' +
    ');';
end;

initialization
  TProduct.RegisterClass;
  TProductQuery.RegisterClass;
  TBudget.RegisterClass;
  TBudgetQuery.RegisterClass;
  TBudgetItem.RegisterClass;
  TInvoice.RegisterClass;
  TInvoiceQuery.RegisterClass;
  TInvoiceItem.RegisterClass;

finalization
  TProduct.UnregisterClass;
  TProductQuery.UnregisterClass;
  TBudget.UnregisterClass;
  TBudgetQuery.UnregisterClass;
  TBudgetItem.UnregisterClass;
  TInvoice.UnregisterClass;
  TInvoiceQuery.UnregisterClass;
  TInvoiceItem.UnregisterClass;

end.

