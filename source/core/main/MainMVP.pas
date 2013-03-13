unit MainMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  PressMVP
  ,PressMVPPresenter
  ,PressMVPCommand
  ,PressMVPModel
  ,PressSubject;

type

  { TMainFormPresenter }

  TMainFormPresenter = class(TPressMVPMainFormPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMainConnectorCommand }

  TMainConnectorCommand = class(TPressMVPCommand)
  protected
    procedure InternalExecute; override;
    function InternalIsEnabled: Boolean; override;
    function GetCaption: string; override;
  end;

implementation

uses
  Clipbrd
  ,Forms
  ,PressOPF
  ,LCLType
  ,PressUser
  ,RecipeMVP
  ,FermenterMVP
  ,LocationMVP
  ,MashMVP
  ,ContactMVP
  ,EquipmentMVP
  ,EquipmentProfileMVP
  ,AccountChartMVP
  ,ProductMVP;

{ TMainFormPresenter }

procedure TMainFormPresenter.InitPresenter;
begin
  inherited;
  BindCommand(TPressMVPCloseApplicationCommand, 'ExitMenuItem');
  BindCommand(TMainConnectorCommand, 'MetadataMenuItem');
  BindPresenter(TRecipeQueryPresenter, 'RecipeMenuItem');
  BindPresenter(TFermenterQueryPresenter, 'FermenterMenuItem');
  BindPresenter(TLocationQueryPresenter, 'LocationMenuItem');
  BindPresenter(TFermenterEventQueryPresenter, 'FermenterEventMenuItem');
  BindPresenter(TMashQueryPresenter, 'MashMenuItem');
  BindPresenter(TContactQueryPresenter, 'ContactMenuItem');
  BindPresenter(TEquipmentQueryPresenter, 'EquipmentMenuItem');
  BindPresenter(TEquipmentProfileQueryPresenter, 'EquipmentProfileMenuItem');
  BindPresenter(TAccountChartQueryPresenter, 'AccountChartMenuItem');
  BindPresenter(TProductQueryPresenter, 'ProductMenuItem');
  BindPresenter(TBudgetQueryPresenter, 'BudgetMenuItem');
  { sample commands, to be implemented very soon... }
  //BindCommand(TProprietarioSetupCommand2, 'Proprietario1');
  PressUserData.Logon('', '');
end;

{ TMainConnectorCommand }

procedure TMainConnectorCommand.InternalExecute;
begin
  Clipboard.AsText := PressOPFService.CreateDatabaseStatement;
  Application.MessageBox('Metadados copiados para a área de transferência.',
    'Metadados', MB_ICONINFORMATION);
end;

function TMainConnectorCommand.InternalIsEnabled: Boolean;
begin
  Result := True;
end;

function TMainConnectorCommand.GetCaption: string;
begin
  Result := 'Copiar metadados do banco de dados para área de transferência';
end;

end.

