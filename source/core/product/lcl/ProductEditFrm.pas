unit ProductEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TProductEditForm }

  TProductEditForm = class(TCustomEditForm)
    AddUnitySpeedButton: TSpeedButton;
    Button1: TButton;
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
    EditUnitySpeedButton: TSpeedButton;
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
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  ProductMVP,
  PressXCLBroker,
  MainFrm;

{ TProductEditForm }

constructor TProductEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddUnitySpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditUnitySpeedButton.Glyph);
end;

initialization
  PressXCLForm(TProductEditPresenter, TProductEditForm);

{$R *.lfm}

end.

