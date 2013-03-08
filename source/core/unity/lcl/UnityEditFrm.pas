unit UnityEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TUnityEditForm }

  TUnityEditForm = class(TCustomEditForm)
    AbbreviationEdit: TEdit;
    AbreviationLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  UnityMVP;

{$R *.lfm}

initialization
  PressXCLForm(TUnityEditPresenter, TUnityEditForm);

end.

