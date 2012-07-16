unit FillingBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressAttributes,
  CustomBO,
  FermenterBO,
  MashBO;

implementation

type
  TRecipientKind = (rkBottle, rkKeg, rkPostmix, rkOakBarrell);

  TRecipient = class(TCustomObject)
  end;

initialization


finalization

end.

