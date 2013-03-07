unit ProductMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

type

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
    'CurrentStock(100, "Est. atual");' +
    'CurrentStockCost(100, "Custo est. atual);' +
    'Price(100, "Preço")';
end;

{ TProductEditPresenter }

procedure TProductEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Unity', 'UnityComboBox');
  CreateSubPresenter('MinimumStock', 'MinimumStockEdit');
  CreateSubPresenter('MaximumStock', 'MaximumStockEdit');
  CreateSubPresenter('CurrentStock', 'CurrentStockEdit');
  CreateSubPresenter('Budgets', 'BudgetsStringGrid');
  CreateSubPresenter('Invoices', 'InvoicesStringGrid');
  CreateSubPresenter('Cost', 'CostEdit');
  CreateSubPresenter('ProfitRate', 'ProfitRateEdit');
  CreateSubPresenter('CurrentStockCost', 'CurrentStockCostEdit');
  CreateSubPresenter('Price', 'PriceEdit');
  CreateSubPresenter('CurrentStockPrice', 'CurrentStockPriceEdit');
end;

initialization
  TProductEditPresenter.RegisterBO(TProductBO);

end.

