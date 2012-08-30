unit CompanyEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, ContactEditFrm;

type

  { TCompanyEditForm }

  TCompanyEditForm = class(TContactEditForm)
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
    IEEdit: TEdit;
    IELabel: TLabel;
    CNPJLabel: TLabel;
    PersonContactTab: TTabSheet;
  end;

implementation

uses
  PressXCLBroker,
  ContactMVP;

{$R *.lfm}

initialization
  PressXCLForm(TCompanyEditPresenter, TCompanyEditForm);

end.

