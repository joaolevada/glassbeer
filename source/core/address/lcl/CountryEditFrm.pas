unit CountryEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TCountryEditForm }

  TCountryEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TCountryEditPresenter, TCountryEditForm);

end.

