unit FermenterMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP
  ,FermenterBO;

type

  { TFermenterEditPresenter }

  TFermenterEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TFermenterQueryPresenter }

  TFermenterQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TFermenterEventItemEditPresenter }

  TFermenterEventItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TFermenterEventEditPresenter }

  TFermenterEventEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TFermenterEventQueryPresenter }

  TFermenterEventQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;


implementation

uses
  PressMVPCommand,
  PressMVPPresenter;

{ TFermenterEventEditPresenter }

procedure TFermenterEventEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('Duration', 'DurationEdit');
  CreateSubPresenter('Temperature', 'TemperatureEdit');
end;

{ TFermenterEventItemEditPresenter }

procedure TFermenterEventItemEditPresenter.InitPresenter;
var
  VFermenterEventPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VFermenterEventPresenter :=  CreateSubPresenter('FermenterEvent', 'FermenterEventCombo',
    'BasicUserRecordData.Name');
  VFermenterEventPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddFermenterEventSpeedButton');
  VFermenterEventPresenter.BindCommand(TPressMVPEditItemCommand, 'EditFermenterEventSpeedButton');
  CreateSubPresenter('ExpirationDate', 'ExpirationDateEdit');
  CreateSubPresenter('Expired', 'ExpiredEdit');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('Temperature', 'TemperatureEdit');
  CreateSubPresenter('Gravity', 'GravityEdit');
end;

{ TFermenterQueryPresenter }

procedure TFermenterQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TFermenterQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome");' +
    'UtilCapacity(99, "Capacidade útil");' +
    'Status(99, "Status")';
end;

{ TFermenterEditPresenter }

procedure TFermenterEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('FullCapacity', 'FullCapacityEdit');
  CreateSubPresenter('HeadSpace', 'HeadSpaceEdit');
  CreateSubPresenter('Location', 'LocationCombo', 'BasicUserRecordData.Name');
  CreateSubPresenter('UtilCapacity', 'UtilCapacityEdit');
  CreateSubPresenter('CurrentVolume', 'CurrentVolumeEdit');
  CreateSubPresenter('Status', 'StatusCombo');
end;

{ TFermenterEventQueryPresenter }

procedure TFermenterEventQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TFermenterEventQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome");' +
    'Duration(109, "Duração[dias]");' +
    'Temperature(79, "Temp.[ºC]")';
end;


initialization
  TFermenterEditPresenter.RegisterBO(TFermenter);
  TFermenterEventEditPresenter.RegisterBO(TFermenterEvent);
  TFermenterEventItemEditPresenter.RegisterBO(TFermenterEventItem);
  TFermenterEventQueryPresenter.RegisterBO(TFermenterEventQuery);
  TFermenterQueryPresenter.RegisterBO(TFermenterQuery);

end.

