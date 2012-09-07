unit CompanyEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, ContactEditFrm;

type

  { TCompanyEditForm }

  TCompanyEditForm = class(TContactEditForm)
    AddContactLabelSpeedButton: TSpeedButton;
    CNPJEdit: TEdit;
    ContactExtensionLineEdit: TEdit;
    ContactExtensionLineLabel: TLabel;
    ContactGroupBox: TGroupBox;
    ContactLabelComboBox: TComboBox;
    ContactLabelLabel: TLabel;
    ContactPersonComboBox: TComboBox;
    ContactPersonLabel: TLabel;
    ContactsLabel: TLabel;
    ContactsStringGrid: TStringGrid;
    EditContactLabelSpeedButton: TSpeedButton;
    IEEdit: TEdit;
    IELabel: TLabel;
    CNPJLabel: TLabel;
    PersonContactTab: TTabSheet;
    AddContactSpeedButton: TSpeedButton;
    EditContactSpeedButton: TSpeedButton;
    RemoveContactSpeedButton: TSpeedButton;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ContactMVP,
  MainFrm;

{ TCompanyEditForm }

constructor TCompanyEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddContactSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditContactSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveContactSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddContactLabelSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditContactLabelSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TCompanyEditPresenter, TCompanyEditForm);

end.

