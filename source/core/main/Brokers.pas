unit Brokers;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  PressSQLdbBroker;

type

  { TGlassBeerConnectionBroker }

  TGlassBeerConnectionBroker = class(TPressSQLdbBroker)
  protected
    procedure InitService; override;
  end;

implementation

uses
  PressSubject
  ,PressAttributes
  ,PressApplication
  {$IFDEF FPC}
  ,IBConnection, pqconnection
  {$ELSE}
  ,PressIBXBroker
  {$ENDIF}
  ,PressFastReportBroker
  ,PressMessages_ptbr;

{ TGlassBeerConnectionBroker }

procedure TGlassBeerConnectionBroker.InitService;
begin
  inherited InitService;
  Connector.Database.Params.Values['port'] := '9999';
end;

initialization
  TGlassBeerConnectionBroker.RegisterService(True);
  PressApp.ConfigFileName := 'glassbeer.cf';
  PressModel.ClassIdStorageName := 'ModelClasses';
  PressModel.DefaultGeneratorName := 'gen_glassbeer';
  PressModel.DefaultKeyType := TPressInt64;

end.
