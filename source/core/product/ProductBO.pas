unit ProductBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  PressSubject;

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
    _ItemAmount: TPressFloat;
  protected
    class function InternalMetadataStr: string; override;
    procedure InternalCalcAttribute(AAttribute: TPressAttribute); override;
  private
    function GetShipping: Currency;
    function GetSumOfItems: Currency;
    function GetTotalBudget: Currency;
    procedure SetShipping(AValue: Currency);
    procedure SetSumOfItems(AValue: Currency);
    procedure SetTotalBudget(AValue: Currency);
    function SumItemsValues: Currency;
    function SumItemsQuantity: Double;
  public
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
    _Quantity: TPressFloat;
    _UnityValue: TPressCurrency;
    _TotalValue: TPressCurrency;
    _ItemOf: TPressReference;
    _Shipping: TPressFloat;
  private
    function GetQuantity: Double;
    function GetTotalValue: Currency;
    procedure SetQuantity(AValue: Double);
    procedure SetTotalValue(AValue: Currency);
  protected
    class function InternalMetadataStr: string; override;
  public
    property Quantity: Double read GetQuantity write SetQuantity;
    property TotalValue: Currency read GetTotalValue write SetTotalValue;
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
    _ItemAmount: TPressFloat;
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
    _Quantity: TPressFloat;
    _UnityValue: TPressCurrency;
    _TotalValue: TPressCurrency;
    _ItemOf: TPressReference;
    _Shipping: TPressFloat;
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
    'Quantity: Float;' +
    'UnityValue: Currency;' +
    'TotalValue: Currency;' +
    'ItemOf: Reference(TInvoice);' +
    'Shipping: Float Calc(Quantity, ItemOf)' +
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
    'ItemAmont: Float Calc(Items)' +
    ');';
end;

{ TBudgetItem }

function TBudgetItem.GetQuantity: Double;
begin
  Result := _Quantity.Value;
end;

function TBudgetItem.GetTotalValue: Currency;
begin
  Result := _TotalValue.Value;
end;

procedure TBudgetItem.SetQuantity(AValue: Double);
begin
  _Quantity.Value := AValue;
end;

procedure TBudgetItem.SetTotalValue(AValue: Currency);
begin
  _TotalValue.Value := AValue;
end;

class function TBudgetItem.InternalMetadataStr: string;
begin
  Result := 'TBudgetItem IsPersistent(' +
    'Product: Reference(TProduct);' +
    'Unity: Reference(TUnity);' +
    'Quantity: Float;' +
    'UnityValue: Currency;' +
    'TotalValue: Currency;' +
    'ItemOf: Reference(TBudget);' +
    'Shipping: Float Calc(Quantity, ItemOf)' +
    ');';
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
    'ItemAmount: Integer Calc(Items)' +
    ');';
end;

procedure TBudget.InternalCalcAttribute(AAttribute: TPressAttribute);
begin
  if AAttribute = _SumOfItems then
    SumOfItems := SumItemsValues
  else if AAttribute = _TotalBudget then
    TotalBudget := SumOfItems + Shipping;
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

function TBudget.SumItemsQuantity: Double;
var
  i: Integer;
  VPartial: Double;
  VBudgetItem: TBudgetItem;
begin
  VPartial := 0;
  for i := 0 to Pred(_Items.Count)do
  begin
    VBudgetItem := _Items[i] as TBudgetItem;
    VPartial += VBudgetItem.Quantity;
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

