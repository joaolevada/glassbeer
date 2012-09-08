unit PersonContactEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TPersonContactEditForm }

  TPersonContactEditForm = class(TCustomEditForm)
    AddPersonSpeedButton: TSpeedButton;
    EditPersonSpeedButton: TSpeedButton;
    ExtensionLineEdit: TEdit;
    ExtensionLineLabel: TLabel;
    PersonComboBox: TComboBox;
    PersonLabel: TLabel;
    LabelComboBox: TComboBox;
    LabelLabel: TLabel;
    AddLabelSpeedButton: TSpeedButton;
    EditLabelSpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ContactMVP,
  MainFrm;

{ TPersonContactEditForm }

constructor TPersonContactEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditLabelSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddPersonSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditPersonSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TPersonContactEditPresenter, TPersonContactEditForm);

end.

