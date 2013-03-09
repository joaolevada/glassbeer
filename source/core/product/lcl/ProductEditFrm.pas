unit ProductEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TProductEditForm }

  TProductEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    CostEdit: TEdit;
    CostLabel: TLabel;
    CurrentStockCostEdit: TEdit;
    CurrentStockCostLabel: TLabel;
    CurrentStockEdit: TEdit;
    CurrentStockLabel: TLabel;
    CurrentStockPriceEdit: TEdit;
    CurrentStockPriceLabel: TLabel;
    LastPurchaseDateEdit: TEdit;
    LastPurchaseDateLabel: TLabel;
    MaximumStockEdit: TEdit;
    MaximumStockLabel: TLabel;
    MinimumStockEdit: TEdit;
    MinimumStockLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    PriceEdit: TEdit;
    PriceLabel: TLabel;
    ProfitRateEdit: TEdit;
    ProfitRateLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    StockTabSheet: TTabSheet;
    UnityComboBox: TComboBox;
    UnityLabel: TLabel;
  private
  end;

implementation

uses
  ProductMVP,
  PressXCLBroker;

initialization
  PressXCLForm(TProductEditPresenter, TProductEditForm);

{$R *.lfm}

end.

