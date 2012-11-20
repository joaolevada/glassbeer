unit EquipmentProfileMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

type

  { TEquipmentProfileEditPresenter }

  TEquipmentProfileEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TEquipmentProfileQueryPresenter }

  TEquipmentProfileQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

implementation

uses
  EquipmentProfileBO;

{ TEquipmentProfileQueryPresenter }

procedure TEquipmentProfileQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  //CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
end;

function TEquipmentProfileQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome");' +
    'GrainAbsorption(99, "Absor. água");' +
    'EvaporationRate(99, "Tx. evap. (minuto)")' +
    'KettleToFermenterLoss(99, "Perda ferv. p/ ferm.")';
end;

{ TEquipmentProfileEditPresenter }

procedure TEquipmentProfileEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('GrainAbsorption', 'GrainAbsorptionEdit');
  CreateSubPresenter('EvaporationRate', 'EvaporationRateEdit');
  CreateSubPresenter('KettleToFermenterLoss', 'KettleToFermenterLossEdit');
end;

initialization
  TEquipmentProfileEditPresenter.RegisterBO(TEquipmentProfile);

end.

