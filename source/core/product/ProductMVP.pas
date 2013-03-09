unit ProductMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

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

implementation

uses
  ProductBO;

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
begin
  inherited InitPresenter;
  CreateSubPresenter('Product', 'ProductComboBox', 'Name');
  CreateSubPresenter('Unity', 'UnityComboBox', 'Name');
  CreateSubPresenter('Quantity', 'QuantityEdit');
  CreateSubPresenter('UnityValue', 'UnityValueEdit');
  CreateSubPresenter('TotalValue', 'TotalValueEdit');
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
    'Supplier.NickName(200, "Fornecedor");' +
    'Date(80, "Data");' +
    'SumOfItems(80, "Itens");' +
    'Shipping(70, "Frete");' +
    'TotalBudget(90, "Total")';
end;

{ TBudgetEditPresenter }

procedure TBudgetEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Supplier', 'SupplierComboBox',
    'BasicUserRecordData.Name');
  CreateSubPresenter('Supplier', 'SupplierComboBox1',
    'BasicUserRecordData.Name');
  CreateSubPresenter('Shipping', 'ShippingEdit');
  CreateSubPresenter('Shipping', 'ShippingEdit1');
  CreateSubPresenter('SumOfItems', 'SumOfItemsEdit');
  CreateSubPresenter('SumOfItems', 'SumOfItemsEdit1');
  CreateSubPresenter('TotalBudget', 'TotalBudgetEdit');
  CreateSubPresenter('TotalBudget', 'TotalBudgetEdit1');
  CreateSubPresenter('Items', 'ItemsStringGrid',
    'Product.Name(200, "Produto");' +
    'Unity.Abbreviation(50, "Unidade");' +
    'Quantity(50, "Qtde.");' +
    'UnityValue(50, "Vl. unit.");' +
    'TotalValue(70, "Total")');
  CreateSubPresenter('Date', 'DateEdit');
  CreateSubPresenter('ExpireDate', 'ExpireDateEdit');
  CreateSubPresenter('ItemCount', 'ItemCountEdit');
  CreateSubPresenter('ItemCount', 'ItemCountEdit1');
  CreateSubPresenter('ItemAmount', 'ItemAmountEdit');
  CreateSubPresenter('ItemAmount', 'ItemAmountEdit1');
end;

{ TProductQueryPresenter }

procedure TProductQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
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
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Unity', 'UnityComboBox', 'Name');
  CreateSubPresenter('MinimumStock', 'MinimumStockEdit');
  CreateSubPresenter('MaximumStock', 'MaximumStockEdit');
  CreateSubPresenter('CurrentStock', 'CurrentStockEdit');
  //CreateSubPresenter('Budgets', 'BudgetsStringGrid');
  //CreateSubPresenter('Invoices', 'InvoicesStringGrid');
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
  TBudgetEditPresenter.RegisterBO(TBudget);
  TBudgetQueryPresenter.RegisterBO(TBudgetQuery);
  TBudgetItemEditPresenter.RegisterBO(TBudgetItem);
  TInvoiceEditPresenter.RegisterBO(TInvoice);
  TInvoiceQueryPresenter.RegisterBO(TInvoiceQuery);
  TInvoiceItemEditPresenter.RegisterBO(TInvoiceItem);

end.

