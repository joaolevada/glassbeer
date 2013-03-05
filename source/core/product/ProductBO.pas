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
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TProduct }

class function TProduct.InternalMetadataStr: string;
begin
  Result := 'TProduct IsPersistent(' +
    'Code: PlainString;' +
    'Name: AnsiString DisplayName="Name" IsMandatory=True;' +
    'Remarks: Memo' +
    'Unity: Reference(TUnity);' +
    'MinimumStock: Float;' +
    'MaximumStock: Float;' +
    'CurrentStock: Float;' +
    'Budgets: References(TBudget);' +
    'Invoices: References(TInvoice);' +
    ');';
end;

initialization
  TProduct.RegisterClass;

finalization
  TProduct.UnregisterClass;

end.

