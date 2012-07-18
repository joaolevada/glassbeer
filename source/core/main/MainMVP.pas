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
  RawMaterialMVP
  ,Clipbrd
  ,Forms
  ,PressOPF
  ,windows
  ,PressUser
  ,RecipeMVP
  ,FermenterMVP
  ,LocationMVP
  ,MashMVP;

{ TMainFormPresenter }

procedure TMainFormPresenter.InitPresenter;
begin
  inherited;
  BindCommand(TPressMVPCloseApplicationCommand, 'ExitMenu');
  BindCommand(TMainConnectorCommand, 'MetadataMenu');
  BindPresenter(TRawMaterialQueryPresenter, 'RawMaterialMenu');
  BindPresenter(TRecipeQueryPresenter, 'RecipeMenu');
  BindPresenter(TFermenterQueryPresenter, 'FermenterMenu');
  BindPresenter(TLocationQueryPresenter, 'LocationMenu');
  BindPresenter(TFermenterEventQueryPresenter, 'FermenterEventMenu');
  BindPresenter(TMashQueryPresenter, 'MashMenu');
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

