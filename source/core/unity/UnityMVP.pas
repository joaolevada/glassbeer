unit UnityMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP;

type

  { TUnityEditPresenter }

  TUnityEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

uses
  UnityBO;

{ TUnityEditPresenter }

procedure TUnityEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Abbreviation', 'AbbreviationEdit');
  CreateSubPresenter('WeightInKilograms', 'WeightInKilogramsEdit');
end;

initialization
  TUnityEditPresenter.RegisterBO(TUnity);

end.

