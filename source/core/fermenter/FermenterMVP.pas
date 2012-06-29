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
  end;


implementation

{ TFermenterQueryPresenter }

procedure TFermenterQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
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
  TFermenterQueryPresenter.RegisterBO(TFermenterQuery);

end.

