unit LogBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes;

type

  { TGeneralLog }

  TGeneralLog = class(TCustomObject)
    _RemarkedAt: TPressDateTime;
    _Remarks: TPressMemo;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TGeneralLog }

class function TGeneralLog.InternalMetadataStr: string;
begin
  Result := 'TGeneralLog IsPersistent (' +
    'RemarkedAt: DateTime DefaultValue="now" EditMask="dd/MM/yyyy hh:nn";' +
    'Remarks: Memo;' +
    ')';
end;

initialization
  TGeneralLog.RegisterClass;

finalization
  TGeneralLog.UnregisterClass;

end.

