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

{ TMashIngredientItemEditPresenter }

procedure TMashIngredientItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RawMaterial', 'RawMaterialCombo',
    'BasicUserRecordData.Name');
  CreateSubPresenter('Quantity', 'QuantityEdit');
  CreateSubPresenter('RawMaterial.Unity', 'UnityEdit');
end;

{ TMashItemEditPresenter }

procedure TMashItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Recipe', 'RecipeCombo',
    'BasicUserRecordData.Name');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('OriginalGravity', 'OriginalGravityEdit');
  CreateSubPresenter('MashIngredients', 'MashIngredientsGrid',
    'RawMaterial.BasicUserRecordData.Name(198, "Matéria prima");' +
    'Quantity(49, "Qtde.")');
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
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('MashItems', 'MashItemsGrid',
    'Recipe.BasicUserRecordData.Name(356, "Receita");' +
    'Volume(198, "Volume");' +
    'OriginalGravity(198, "Densidade inicial")');
  CreateSubPresenter('AverageOriginalGravity', 'AverageOriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
  CreateSubPresenter('Amount', 'AmountEdit');
  CreateSubPresenter('Fermenters', 'FermentersGrid',
    'Fermenter.BasicUserRecordData.Name(198, "Fermentador");' +
    'Volume(99, "Volume");' +
    'StartDate(99, "D.iníc.");' +
    'DaysSinceStart(49, "D.d.i.");' +
    'DaysSinceLastEvent(69, "D.d.ú.e.")');
end;

{ TMashFermenterItemEditPresenter }

procedure TMashFermenterItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Fermenter', 'FermenterCombo', 'BasicUserRecordData.Name');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('StartDate', 'StartDateEdit');
  CreateSubPresenter('DaysSinceStart', 'DaysSinceStartEdit');
  CreateSubPresenter('DaysSinceLastEvent', 'DaysSinceLastEventEdit');
  CreateSubPresenter('FermenterEvents', 'FermenterEventsGrid',
    'FermenterEvent.BasicUserRecordData.Name(198, "Evento");' +
    'ExpirationDate(99, "D.validade");' +
    'Expired(59, "Vencido");' +
    'Volume(59, "Volume");' +
    'Temperature(69, "Temp.[ºC]");' +
    'Gravity(69, "Densid.")');
end;

initialization
  TMashEditPresenter.RegisterBO(TMash);
  TMashFermenterItemEditPresenter.RegisterBO(TMashFermenterItem);
  TMashIngredientItemEditPresenter.RegisterBO(TMashIngredientItem);
  TMashItemEditPresenter.RegisterBO(TMashItem);
  TMashQueryPresenter.RegisterBO(TMashQuery);

end.

