unit InternetAddressEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TInternetAddressEditForm }

  TInternetAddressEditForm = class(TCustomEditForm)
    AddLabelSpeedButton: TSpeedButton;
    EditLabelSpeedButton: TSpeedButton;
    LabelComboBox: TComboBox;
    AddressEdit: TEdit;
    LabelLabel: TLabel;
    AddressLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AddressMVP,
  PressXCLBroker,
  MainFrm;

{ TInternetAddressEditForm }

constructor TInternetAddressEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditLabelSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TInternetAddressEditPresenter, TInternetAddressEditForm);

end.

