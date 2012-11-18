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

  TEquipmentProfileQueryPresenter = class(TCustomQueryPresenter)

  end;

implementation

uses
  EquipmentProfileBO;

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

