unit WaterCalculatorEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, ComCtrls;

type

  { TWaterCalcEditForm }

  { TWaterCalculatorEditForm }

  TWaterCalculatorEditForm = class(TForm)
    ApplyButton: TBitBtn;
    BottomPanel: TPanel;
    CancelButton: TBitBtn;
    EditPageControl: TPageControl;
    EvaporationLossEdit: TEdit;
    EvaporationLossLabel: TLabel;
    GrainAmountEdit: TEdit;
    GrainAmountLabel: TLabel;
    GrainLossEdit: TEdit;
    GrainLossLabel: TLabel;
    MainTab: TTabSheet;
    MashItemLabel: TLabel;
    MashItemRecipeLabel: TLabel;
    MashItemVolumeLabel: TLabel;
    MashWaterRateEdit: TEdit;
    MashWaterRateLabel: TLabel;
    ProfileComboBox: TComboBox;
    ProfileLabel: TLabel;
    SpargeWaterEdit: TEdit;
    SpargeWaterLabel: TLabel;
    StartWaterEdit: TEdit;
    StartWaterLabel: TLabel;
    TotalLossEdit: TEdit;
    TotalLossLabel: TLabel;
    TotalWaterEdit: TEdit;
    TotalWaterLabel: TLabel;
  private
    { private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  EquipmentProfileMVP,
  MainFrm;

{ TWaterCalculatorEditForm }

constructor TWaterCalculatorEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons32ImageList.GetBitmap(IMG_ACCEPT, ApplyButton.Glyph);
  MainForm.Icons32ImageList.GetBitmap(IMG_CANCEL, CancelButton.Glyph);
end;
  
initialization
  PressXCLForm(TWaterCalculatorEditPresenter, TWaterCalculatorEditForm);
  

end.

