unit PhoneEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TPhoneEditForm }

  TPhoneEditForm = class(TCustomEditForm)
    LabelComboBox: TComboBox;
    NumberEdit: TEdit;
    LabelLabel: TLabel;
    NumberLabel: TLabel;
    AddLabelSpeedButton: TSpeedButton;
    EditLabelSpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  PressXCLBroker,
  AddressMVP,
  MainFrm;

{ TPhoneEditForm }

constructor TPhoneEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditLabelSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TPhoneEditPresenter, TPhoneEditForm);

end.

