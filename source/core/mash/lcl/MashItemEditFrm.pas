unit MashItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashItemEditForm }

  TMashItemEditForm = class(TCustomEditForm)
    AddGeneralLogSpeedButton: TSpeedButton;
    AddMashIngredientSpeedButton: TSpeedButton;
    AddTemperatureLogSpeedButton: TSpeedButton;
    AddGravityLogSpeedButton: TSpeedButton;
    BoilTimeEdit: TEdit;
    BoilTimeLabel: TLabel;
    EditGeneralLogSpeedButton: TSpeedButton;
    EditMashIngredientSpeedButton: TSpeedButton;
    EditTemperatureLogSpeedButton: TSpeedButton;
    EditGravityLogSpeedButton: TSpeedButton;
    GeneralLogLabel: TLabel;
    GeneralLogRemarkedAtEdit: TEdit;
    GeneralLogRemarkedAtLabel: TLabel;
    GeneralLogRemarksLabel: TLabel;
    GeneralLogRemarksMemo: TMemo;
    GeneralLogStringGrid: TStringGrid;
    GeneralLogGroupBox: TGroupBox;
    MashIngredientsLabel: TLabel;
    MashIngredientsStringGrid: TStringGrid;
    GravityLogTabSheet: TTabSheet;
    RemoveGeneralLogSpeedButton: TSpeedButton;
    SpargeWaterEdit: TEdit;
    SpargeWaterLabel: TLabel;
    StartWaterEdit: TEdit;
    StartWaterLabel: TLabel;
    GeneralLogTabSheet: TTabSheet;
    TotalWaterEdit: TEdit;
    TotalWaterLabel: TLabel;
    WaterTabSheet: TTabSheet;
    TemperatureGroupBox: TGroupBox;
    TemperatureMeasuredAtEdit: TEdit;
    TemperatureMeasuredAtLabel: TLabel;
    TemperatureEdit: TEdit;
    TemperatureLabel: TLabel;
    RemoveGravityLogSpeedButton: TSpeedButton;
    GravityLogLabel: TLabel;
    TemperatureLogStringGrid: TStringGrid;
    OriginalGravityEdit: TEdit;
    OriginalGravityLabel: TLabel;
    AddRecipeSpeedButton: TSpeedButton;
    EditRecipeSpeedButton: TSpeedButton;
    IngredientsTabSheet: TTabSheet;
    RemoveMashIngredientSpeedButton: TSpeedButton;
    RemoveTemperatureLogSpeedButton: TSpeedButton;
    TemperatureLogLabel: TLabel;
    GravityLogStringGrid: TStringGrid;
    TemperatureLogTabSheet: TTabSheet;
    VolumeEdit: TEdit;
    VolumeLabel: TLabel;
    RecipeComboBox: TComboBox;
    RecipeLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP,
  MainFrm;

{ TMashItemEditForm }

constructor TMashItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { mashingredients buttons }
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddMashIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditMashIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveMashIngredientSpeedButton.Glyph);

  { recipe buttons }
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddRecipeSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditRecipeSpeedButton.Glyph);

  { temperaturelog buttons }
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddTemperatureLogSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditTemperatureLogSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveTemperatureLogSpeedButton.Glyph);

  { gravitylog buttons }
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddGravityLogSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditGravityLogSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveGravityLogSpeedButton.Glyph);

  { generallog buttons }
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddGeneralLogSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditGeneralLogSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveGeneralLogSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashItemEditPresenter, TMashItemEditForm);

end.

