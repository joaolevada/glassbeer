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


implementation

{ TFermenterEventEditPresenter }

procedure TFermenterEventEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  {TFermenterEvent = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _Duration: TPressInteger;
    _Temperature: TPressDouble;}
  { TODO 1 -ojoaolevada -cimplementation : Continue implementation from here }
end;

{ TFermenterEventItemEditPresenter }

procedure TFermenterEventItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('FermenterEvent', 'FermenterEventCombo');
  CreateSubPresenter('ExpirationDate', 'ExpirationDateEdit');
  CreateSubPresenter('Expired', 'ExpiredEdit');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('Temperature', 'TemperatureEdit');
  CreateSubPresenter('CurrentGravity', 'CurrentGravityEdit');
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

initialization
  TFermenterEditPresenter.RegisterBO(TFermenter);
  TFermenterEventItemEditPresenter.RegisterBO(TFermenterEventItem);
  TFermenterQueryPresenter.RegisterBO(TFermenterQuery);

end.

