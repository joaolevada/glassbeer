unit MashItemLogMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

type

  { TMashItemTemperatureEditPresenter }

  TMashItemTemperatureEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashItemGravityEditPresenter }

  TMashItemGravityEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  MashItemLogBO;

{ TMashItemGravityEditPresenter }

procedure TMashItemGravityEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('MeasuredAt', 'MeasuredAtEdit');
  CreateSubPresenter('InputType', 'InputTypeComboBox');
  CreateSubPresenter('SpecificGravity', 'SpecificGravityEdit');
  CreateSubPresenter('Brix', 'BrixEdit');
end;

{ TMashItemTemperatureEditPresenter }

procedure TMashItemTemperatureEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('MeasuredAt', 'MeasuredAtEdit');
  CreateSubPresenter('Temperature', 'TemperatureEdit');
end;

initialization
  TMashItemTemperatureEditPresenter.RegisterBO(TMashItemTemperature);
  TMashItemGravityEditPresenter.RegisterBO(TMashItemGravity);

end.

