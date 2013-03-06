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
  protected
    class function InternalMetadataStr: string; override;
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
    _Profit: TPressFloat;
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
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

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
    ');';
end;

{ TBudgetItem }

class function TBudgetItem.InternalMetadataStr: string;
begin
  Result := 'TBudgetItem IsPersistent(' +
    'Product: Reference(TProduct);' +
    'Unity: Reference(TUnity);' +
    'Quantity: Float;' +
    'UnityValue: Currency;' +
    'TotalValue: Currency;' +
    'ItemOf: Reference(TBudget);' +
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
    ');';
end;

{ TProduct }

class function TProduct.InternalMetadataStr: string;
begin
  Result := 'TProduct IsPersistent(' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40) DisplayName="Name" IsMandatory=True;' +
    'Remarks: Memo' +
    'Unity: Reference(TUnity);' +
    'MinimumStock: Float;' +
    'MaximumStock: Float;' +
    'CurrentStock: Float;' +
    'Budgets: References(TBudget);' +
    'Invoices: References(TInvoice);' +
    'Cost: Currency;' +
    'Profit: Float;' +
    ');';
end;

initialization
  TProduct.RegisterClass;
  TBudget.RegisterClass;
  TBudgetItem.RegisterClass;
  TInvoice.RegisterClass;
  TInvoiceItem.RegisterClass;

finalization
  TProduct.UnregisterClass;
  TBudget.UnregisterClass;
  TBudgetItem.UnregisterClass;
  TInvoice.RegisterClass;
  TInvoiceItem.UnregisterClass;

end.

