unit MashItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashItemEditForm }

  TMashItemEditForm = class(TCustomEditForm)
    AddMashIngredientSpeedButton: TSpeedButton;
    AddTemperatureLogSpeedButton: TSpeedButton;
    AddGravityLogSpeedButton: TSpeedButton;
    BoilTimeEdit: TEdit;
    BoilTimeLabel: TLabel;
    EditMashIngredientSpeedButton: TSpeedButton;
    EditTemperatureLogSpeedButton: TSpeedButton;
    EditGravityLogSpeedButton: TSpeedButton;
    MashIngredientsLabel: TLabel;
    MashIngredientsStringGrid: TStringGrid;
    GravityLogTabSheet: TTabSheet;
    SpargeWaterEdit: TEdit;
    SpargeWaterLabel: TLabel;
    StartWaterEdit: TEdit;
    StartWaterLabel: TLabel;
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
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddMashIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditMashIngredientSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveMashIngredientSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddRecipeSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditRecipeSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashItemEditPresenter, TMashItemEditForm);

end.

