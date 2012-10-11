unit MashMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  MashBO;

type

  { TMashEditPresenter }

  TMashEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashQueryPresenter }

  TMashQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TMashItemEditPresenter }

  TMashItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashIngredientItemEditPresenter }

  TMashIngredientItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashFermenterItemEditPresenter }

  TMashFermenterItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  PressMVPPresenter,
  PressMVPCommand;

{ TMashIngredientItemEditPresenter }

procedure TMashIngredientItemEditPresenter.InitPresenter;
var
  VRawMaterialPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VRawMaterialPresenter := CreateSubPresenter('RawMaterial', 'RawMaterialCombo',
    'BasicUserRecordData.Name');
  VRawMaterialPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddRawMaterialSpeedButton');
  VRawMaterialPresenter.BindCommand(TPressMVPEditItemCommand, 'EditRawMaterialSpeedButton');
  CreateSubPresenter('Quantity', 'QuantityEdit');
  CreateSubPresenter('Unity', 'UnityEdit');
end;

{ TMashItemEditPresenter }

procedure TMashItemEditPresenter.InitPresenter;
var
  VIngredientsPresenter: TPressMVPItemsPresenter;
  VRecipePresenter: TPressMVPPresenter;
  VTemperatureLogPresenter: TPressMVPItemsPresenter;
  VGravityLogPresenter: TPressMVPItemsPresenter;
  VTemperaturePresenter: TPressMVPFormPresenter;
  VGravityPresenter: TPressMVPFormPresenter;
begin
  inherited InitPresenter;
  VRecipePresenter := CreateSubPresenter('Recipe', 'RecipeComboBox',
    'BasicUserRecordData.Name');
  VRecipePresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddRecipeSpeedButton');
  VRecipePresenter.BindCommand(TPressMVPEditItemCommand, 'EditRecipeSpeedButton');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('OriginalGravity', 'OriginalGravityEdit');
  VIngredientsPresenter := CreateSubPresenter('MashIngredients', 'MashIngredientsStringGrid',
    'RawMaterial.BasicUserRecordData.Name(198, "Matéria prima");' +
    'RawMaterial.Unity(119, "Unidade");' +
    'Quantity(49, "Qtde.")') as TPressMVPItemsPresenter;
  VIngredientsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddMashIngredientSpeedButton');
  VIngredientsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditMashIngredientSpeedButton');
  VIngredientsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveMashIngredientSpeedButton');

  VTemperatureLogPresenter := CreateSubPresenter('TemperatureLog', 'TemperatureLogStringGrid',
    'MeasuredAt(198, "Momento da aferição");' +
    'Temperature(198, "Temperatura")') as TPressMVPItemsPresenter;
  VTemperatureLogPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddTemperatureLogSpeedButton');
  VTemperatureLogPresenter.BindCommand(TPressMVPEditItemCommand, 'EditTemperatureLogSpeedButton');
  VTemperatureLogPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveTemperatureLogSpeedButton');

  VTemperaturePresenter := CreateDetailPresenter(VTemperatureLogPresenter);
  VTemperaturePresenter.CreateSubPresenter('MeasuredAt', 'TemperatureMeasuredAtEdit');
  VTemperaturePresenter.CreateSubPresenter('Temperature', 'TemperatureEdit');

  VGravityLogPresenter := CreateSubPresenter('GravityLog', 'GravityLogStringGrid',
    'MeasuredAt(198, "Momento da aferição");' +
    'SpecificGravity(198, "Densidade específica");' +
    'Brix(99, "Brix")') as TPressMVPItemsPresenter;
  VGravityLogPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddGravityLogSpeedButton');
  VGravityLogPresenter.BindCommand(TPressMVPEditItemCommand, 'EditGravityLogSpeedButton');
  VGravityLogPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveGravityLogSpeedButton');

  //VGravityPresenter := CreateDetailPresenter(VGravityLogPresenter);
  //VGravityPresenter.CreateSubPresenter('MeasuredAt', 'GravityMeasuredAtEdit');
  //VGravityPresenter.CreateSubPresenter('InputType', 'GravityInputTypeComboBox');
  //VGravityPresenter.CreateSubPresenter('SpecificGravity', 'GravitySpecificGravityEdit');
  //VGravityPresenter.CreateSubPresenter('Brix', 'GravityBrixEdit');
end;

{ TMashQueryPresenter }

procedure TMashQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TMashQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome");' +
    'Amount(99, "Quantidade")';
end;

{ TMashEditPresenter }

procedure TMashEditPresenter.InitPresenter;
var
  VMashItemsPresenter, VFermentersPresenter: TPressMVPItemsPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  VMashItemsPresenter := CreateSubPresenter('MashItems', 'MashItemsStringGrid',
    'Recipe.BasicUserRecordData.Name(356, "Receita");' +
    'Volume(198, "Volume");' +
    'OriginalGravity(198, "Densidade inicial")') as TPressMVPItemsPresenter;
  VMashItemsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddMashItemSpeedButton');
  VMashItemsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditMashItemSpeedButton');
  VMashItemsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveMashItemSpeedButton');
  CreateSubPresenter('AverageOriginalGravity', 'AverageOriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
  CreateSubPresenter('Amount', 'AmountEdit');
  VFermentersPresenter := CreateSubPresenter('Fermenters', 'FermentersStringGrid',
    'Fermenter.BasicUserRecordData.Name(198, "Fermentador");' +
    'Volume(99, "Volume");' +
    'StartDate(99, "D.iníc.");' +
    'DaysSinceStart(49, "D.d.i.");' +
    'DaysSinceLastEvent(69, "D.d.ú.e.")') as TPressMVPItemsPresenter;
  VFermentersPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddFermenterSpeedButton');
  VFermentersPresenter.BindCommand(TPressMVPEditItemCommand, 'EditFermenterSpeedButton');
  VFermentersPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveFermenterSpeedButton');
end;

{ TMashFermenterItemEditPresenter }

procedure TMashFermenterItemEditPresenter.InitPresenter;
var
  VFermenterEventsPresenter: TPressMVPItemsPresenter;
  VFermenterPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VFermenterPresenter := CreateSubPresenter('Fermenter', 'FermenterComboBox', 'BasicUserRecordData.Name');
  VFermenterPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddFermenterSpeedButton');
  VFermenterPresenter.BindCommand(TPressMVPEditItemCommand, 'EditFermenterSpeedButton');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('StartDate', 'StartDateEdit');
  CreateSubPresenter('DaysSinceStart', 'DaysSinceStartEdit');
  CreateSubPresenter('DaysSinceLastEvent', 'DaysSinceLastEventEdit');
  VFermenterEventsPresenter := CreateSubPresenter('FermenterEvents', 'FermenterEventsStringGrid',
    'FermenterEvent.BasicUserRecordData.Name(198, "Evento");' +
    'ExpirationDate(99, "D.validade");' +
    'Expired(59, "Vencido");' +
    'Volume(59, "Volume");' +
    'Temperature(69, "Temp.[ºC]");' +
    'Gravity(69, "Densid.")') as TPressMVPItemsPresenter;
  VFermenterEventsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddFermenterEventSpeedButton');
  VFermenterEventsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditFermenterEventSpeedButton');
  VFermenterEventsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveFermenterEventSpeedButton');
end;

initialization
  TMashEditPresenter.RegisterBO(TMash);
  TMashFermenterItemEditPresenter.RegisterBO(TMashFermenterItem);
  TMashIngredientItemEditPresenter.RegisterBO(TMashIngredientItem);
  TMashItemEditPresenter.RegisterBO(TMashItem);
  TMashQueryPresenter.RegisterBO(TMashQuery);

end.

