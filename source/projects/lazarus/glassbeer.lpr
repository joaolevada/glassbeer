program glassbeer;

{$I '..\..\core\include\glassbeer_defines.inc'}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  CustomBO,
  BasicUserRecordDataBO,
  MashBO,
  RecipeBO, RawMaterialBO;

{$R *.res}

begin
  Application.Title:='Glassbeer sofware';
  Application.Initialize;
  Application.Run;
end.

