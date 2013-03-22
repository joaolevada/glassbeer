unit ProductMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  PressMVPCommand,
  PressMVPPresenter;

type

  { TBudgetEditPresenter }

  TBudgetEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TBudgetQueryPresenter }

  TBudgetQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TBudgetItemEditPresenter }

  TBudgetItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TBudgetItemQueryPresenter }

  TBudgetItemQueryPresenter = class(TPressMVPQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TBudgetCalcShipItemRateCommand }

  TBudgetCalcShipItemRateCommand = class(TPressMVPObjectCommand)
  protected
    procedure InternalExecute; override;
  end;

  { TInvoiceEditPresenter }

  TInvoiceEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TInvoiceQueryPresenter }

  TInvoiceQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TInvoiceItemEditPresenter }

  TInvoiceItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TProductEditPresenter }

  TProductEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TProductQueryPresenter }

  TProductQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TProductBudgetQueryPresenter }

  TProductBudgetQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TShowProductBudgetsCommand }

  TShowProductBudgetsCommand = class(TPressMVPItemsCommand)
  protected
    function InternalIsEnabled: Boolean; override;
    procedure InternalExecute; override;
    function GetCaption: string; override;
    function GetShortCut: TShortCut; override;
  end;

implementation

uses
  ProductBO,
  ContactMVP,
  Menus,
  LCLType;

{ TProductBudgetQueryPresenter }

procedure TProductBudgetQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('MinDate', 'MinDateEdit');
  CreateSubPresenter('MaxDate', 'MaxDateEdit');
end;

function TProductBudgetQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Budget.Name(100, "Orçamento");' +
    'Budget.Date(50, "Data");' +
    'Budget.Supplier.Name(100, "Fornecedor");' +
    'BudgetItem.Quantity(30, "Qtde");' +
    'BudgetItem.Unity.Abbreviation(30, "Unidade");' +
    'BudgetItem.WeightInKilograms(45, "P.tot.[kg]");' +
    'BudgetItem.UnityValue(50, "V.unit");' +
    'BudgetItem.KilogramValue(45, "V.kg");' +
    'BudgetItem.TotalValue(65, "V.Total");' +
    'BudgetItem.Shipping(50, "Frete");' +
    'BudgetItem.ShippingByKilogram(45,"Fr.p/kg")' ;
end;

{ TShowProductBudgetsCommand }

function TShowProductBudgetsCommand.InternalIsEnabled: Boolean;
begin
  Result := Model.Selection.Count = 1;
end;

procedure TShowProductBudgetsCommand.InternalExecute;
var
  VProduct: TProduct;
  VProductBudgetQuery: TProductBudgetQuery;
begin
  VProduct := Model.Selection[0] as TProduct;
  VProductBudgetQuery := TProductBudgetQuery.Create;
  try
    VProductBudgetQuery._Product.Value := VProduct;
    VProductBudgetQuery._MinDate.Value := IncMonth(Date, -1);
    VProductBudgetQuery._MaxDate.Value := Date;
    { TODO 3 -ojoaolevada -cimplementation : TShowProductBudgetsCommand Execute the query }
    TProductBudgetQueryPresenter.Run(VProductBudgetQuery);
  finally
    VProductBudgetQuery.Free;
  end;
end;

function TShowProductBudgetsCommand.GetCaption: string;
begin
  Result := 'Mostrar orçamentos';
end;

function TShowProductBudgetsCommand.GetShortCut: TShortCut;
begin
  Result := Menus.ShortCut(VK_O, [ssCtrl]);
end;

{ TBudgetItemQueryPresenter }

procedure TBudgetItemQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateQueryItemsPresenter('BudgetsStringGrid');
end;

function TBudgetItemQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Quantity(80, "Quantidade");' +
    'Unity.Abbreviation(45, "Unidade");' +
    'UnityValue(80, "Vl. unitário");' +
    'Shipping(80, "Frete");' +
    'TotalValue(100, "Valor total")';
end;

{ TBudgetCalcShipItemRateCommand }

procedure TBudgetCalcShipItemRateCommand.InternalExecute;
var
  VBudget: TBudget;
  VBudgetItem: TBudgetItem;
  I: Integer;
begin
  VBudget := Model.Subject as TBudget;
  if Assigned(VBudget) then
    for I := 0 to Pred(VBudget._Items.Count) do
    begin
      VBudgetItem := VBudget._Items[i] as TBudgetItem;
      VBudgetItem.Shipping := VBudget.Shipping / VBudget.WeightInKilograms *
        VBudgetItem.Quantity;
    end;
end;

{ TInvoiceQueryPresenter }

procedure TInvoiceQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
end;

{ TInvoiceItemEditPresenter }

procedure TInvoiceItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Product', 'ProductComboBox', 'Name');
  CreateSubPresenter('Unity', 'UnityComboBox', 'Name');
  CreateSubPresenter('Quantity', 'QuantityEdit');
  CreateSubPresenter('UnityValue', 'UnityValueEdit');
  CreateSubPresenter('TotalValue', 'TotalValueEdit');
end;

{ TInvoiceEditPresenter }

procedure TInvoiceEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Supplier', 'SupplierComboBox', 'Name');
  CreateSubPresenter('Shipping', 'ShippingEdit');
  CreateSubPresenter('SumOfItems', 'SumOfItemsEdit');
  CreateSubPresenter('TotalInvoice', 'TotalInvoiceEdit');
  CreateSubPresenter('Items', 'ItemsStringGrid');
  CreateSubPresenter('Date', 'DateEdit');
  CreateSubPresenter('ItemCount', 'ItemCountEdit');
  CreateSubPresenter('ItemAmount', 'ItemAmountEdit');
end;

{ TBudgetItemEditPresenter }

procedure TBudgetItemEditPresenter.InitPresenter;
var
  VProductSubPresenter: TPressMVPPresenter;
  VUnitySubPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VProductSubPresenter := CreateSubPresenter('Product', 'ProductComboBox',
    'Name');
  VProductSubPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddProductSpeedButton');
  VProductSubPresenter.BindCommand(TPressMVPEditItemCommand, 'EditProductSpeedButton');

  VUnitySubPresenter := CreateSubPresenter('Unity', 'UnityComboBox', 'Name');
  VUnitySubPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddUnitySpeedButton');
  VUnitySubPresenter.BindCommand(TPressMVPEditItemCommand, 'EditUnitySpeedButton');

  CreateSubPresenter('Quantity', 'QuantityEdit');
  CreateSubPresenter('UnityValue', 'UnityValueEdit');
  CreateSubPresenter('TotalValue', 'TotalValueEdit');
  CreateSubPresenter('WeightInKilograms', 'WeightInKilogramsEdit');
end;

{ TBudgetQueryPresenter }

procedure TBudgetQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('MinDate', 'MinDateEdit');
  CreateSubPresenter('MaxDate', 'MaxDateEdit');
end;

function TBudgetQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(100, "Código");' +
    'Name(200, "Nome");' +
    'Supplier.Name(200, "Fornecedor");' +
    'Date(80, "Data");' +
    'SumOfItems(80, "Itens");' +
    'Shipping(70, "Frete");' +
    'TotalBudget(90, "Total")';
end;

{ TBudgetEditPresenter }

procedure TBudgetEditPresenter.InitPresenter;
var
  VSupplierSubPresenter: TPressMVPPresenter;
  VProductsPresenter: TPressMVPItemsPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  VSupplierSubPresenter := CreateSubPresenter('Supplier', 'SupplierComboBox',
    'Name');
  VSupplierSubPresenter.Model.InsertCommands(0, [TIncludePersonCommand, TIncludeCompanyCommand]);
  VSupplierSubPresenter.BindCommand(TIncludePersonCommand, 'AddSupplierPersonSpeedButton');
  VSupplierSubPresenter.BindCommand(TIncludeCompanyCommand, 'AddSupplierCompanySpeedButton');
  VSupplierSubPresenter.BindCommand(TPressMVPEditItemCommand, 'EditSupplierSpeedButton');
  CreateSubPresenter('Supplier.Name', 'SupplierNameLabel');
  CreateSubPresenter('Shipping', 'ShippingEdit');
  CreateSubPresenter('Shipping', 'ShippingEdit1');
  CreateSubPresenter('SumOfItems', 'SumOfItemsEdit');
  CreateSubPresenter('SumOfItems', 'SumOfItemsEdit1');
  CreateSubPresenter('TotalBudget', 'TotalBudgetEdit');
  CreateSubPresenter('TotalBudget', 'TotalBudgetEdit1');
  VProductsPresenter := CreateSubPresenter('Items', 'ItemsStringGrid',
    'Product.Name(180, "Produto");' +
    'Unity.Abbreviation(50, "Unidade");' +
    'Quantity(50, "Qtde.");' +
    'UnityValue(50, "Vl. unit.");' +
    'TotalValue(70, "Total");' +
    'WeightInKilograms(55, "Peso[kg]");' +
    'KilogramValue(45, "Vl.kg");' +
    'Shipping(80, "Frete[prop.]")' {+
    'ShippingByKilogram(65, "Frete p/ kg.")'}) as TPressMVPItemsPresenter;
  VProductsPresenter.BindCommand(TPressMVPAddItemsCommand,
    'AddProductSpeedButton');
  VProductsPresenter.BindCommand(TPressMVPEditItemCommand,
    'EditProductSpeedButton');
  VProductsPresenter.BindCommand(TPressMVPRemoveItemsCommand,
    'RemoveProductSpeedButton');
  CreateSubPresenter('Date', 'DateEdit');
  CreateSubPresenter('ExpireDate', 'ExpireDateEdit');
  CreateSubPresenter('ItemCount', 'ItemCountEdit');
  CreateSubPresenter('ItemCount', 'ItemCountEdit1');
  CreateSubPresenter('WeightInKilograms', 'WeightInKilogramsEdit');
  CreateSubPresenter('WeightInKilograms', 'WeightInKilogramsEdit1');
  CreateSubPresenter('ShippingByKilogram', 'ShippingByKilogramEdit');
  CreateSubPresenter('ShippingByKilogram', 'ShippingByKilogramEdit1');
end;

{ TProductQueryPresenter }

procedure TProductQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  MainQueryPresenter.BindCommand(TShowProductBudgetsCommand, 'ShowBudgetsButton');
  MainQueryPresenter.Model.InsertCommand(0, TShowProductBudgetsCommand);
end;

function TProductQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(100, "Código");' +
    'Name(200, "Nome");' +
    'Unity.Abbreviation(80, "Unidade");' +
    'CurrentStock(100, "Est. atual");' +
    'CurrentStockCost(100, "Custo est. atual");' +
    'Price(100, "Preço")';
end;

{ TProductEditPresenter }

procedure TProductEditPresenter.InitPresenter;
var
  VUnityPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  VUnityPresenter := CreateSubPresenter('Unity', 'UnityComboBox', 'Name');
  VUnityPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddUnitySpeedButton');
  VUnityPresenter.BindCommand(TPressMVPEditItemCommand, 'EditUnitySpeedButton');
  CreateSubPresenter('MinimumStock', 'MinimumStockEdit');
  CreateSubPresenter('MaximumStock', 'MaximumStockEdit');
  CreateSubPresenter('CurrentStock', 'CurrentStockEdit');
  CreateSubPresenter('Cost', 'CostEdit');
  CreateSubPresenter('ProfitRate', 'ProfitRateEdit');
  CreateSubPresenter('CurrentStockCost', 'CurrentStockCostEdit');
  CreateSubPresenter('Price', 'PriceEdit');
  CreateSubPresenter('CurrentStockPrice', 'CurrentStockPriceEdit');
  CreateSubPresenter('LastPurchaseDate', 'LastPurchaseDateEdit');
end;

initialization
  TProductEditPresenter.RegisterBO(TProduct);
  TProductQueryPresenter.RegisterBO(TProductQuery);
  TProductBudgetQueryPresenter.RegisterBO(TProductBudgetQuery);
  TBudgetEditPresenter.RegisterBO(TBudget);
  TBudgetQueryPresenter.RegisterBO(TBudgetQuery);
  TBudgetItemEditPresenter.RegisterBO(TBudgetItem);
  TInvoiceEditPresenter.RegisterBO(TInvoice);
  TInvoiceQueryPresenter.RegisterBO(TInvoiceQuery);
  TInvoiceItemEditPresenter.RegisterBO(TInvoiceItem);

end.

