unit InternetAddressEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TInternetAddressEditForm }

  TInternetAddressEditForm = class(TCustomEditForm)
    LabelComboBox: TComboBox;
    AddressEdit: TEdit;
    LabelLabel: TLabel;
    AddressLabel: TLabel;
  end;

implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TInternetAddressEditPresenter, TInternetAddressEditForm);

end.

