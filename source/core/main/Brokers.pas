unit Brokers;

{$I '..\include\glassbeer_defines.inc'}

interface

implementation

uses
  PressSubject
  ,PressAttributes
  ,PressApplication
  {$IFDEF FPC}
  ,PressSQLdbBroker, IBConnection, pqconnection
  {$ELSE}
  ,PressIBXBroker
  {$ENDIF}
  ,PressFastReportBroker
  ,PressMessages_ptbr;

initialization
  PressApp.ConfigFileName := 'glassbeer.cf';
  PressModel.ClassIdStorageName := 'ModelClasses';
  PressModel.DefaultGeneratorName := 'gen_glassbeer';
  PressModel.DefaultKeyType := TPressInt64;

end.
