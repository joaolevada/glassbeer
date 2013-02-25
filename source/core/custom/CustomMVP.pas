unit CustomMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  PressMVPPresenter
  ,PressReportManager
  ,PressSubject
  ,PressMVP
  ,PressNotifier
  ,PressMVPModel;


type

  { TCustomEditPresenter }

  TCustomEditPresenter = class(TPressMVPFormPresenter)
  protected
    procedure InitPresenter; override;
    class function InternalModelClass: TPressMVPObjectModelClass; override;
  private
    procedure SaveEvent(AEvent: TPressEvent);
  end;

  { TCustomQueryPresenter }

  TCustomQueryPresenter = class(TPressMVPQueryPresenter)
  private
    FMainQueryPresenter: TPressMVPPresenter;
  protected
    procedure InitPresenter; override;
    class function InternalModelClass: TPressMVPObjectModelClass; override;
    property MainQueryPresenter: TPressMVPPresenter read FMainQueryPresenter;
  end;

  { TCustomEditModel }

  TCustomEditModel = class(TPressMVPObjectModel)
	private
	  FReportManager: TPressReportManager;
	protected
	  procedure Finit; override;
	  procedure SubjectChanged(AOldSubject: TPressSubject); override;
	end;

  { TCustomQueryModel }

  TCustomQueryModel = class(TPressMVPQueryModel)
  private
    FReportManager: TPressReportManager;
  protected
    procedure Finit; override;
    procedure SubjectChanged(AOldSubject: TPressSubject); override;
  end;

implementation

uses
  PressMVPCommand
  ,CustomBO
  ,Classes
  ,Forms
  ,LCLType;

{ TCustomEditModel }

procedure TCustomEditModel.Finit;
begin
  FReportManager.Free;
  inherited Finit;
end;

procedure TCustomEditModel.SubjectChanged(AOldSubject: TPressSubject);
begin
  inherited SubjectChanged(AOldSubject);
  if not Assigned(FReportManager) then
    FReportManager := TPressReportManager.Create(Self);
end;

{ TCustomQueryModel }

procedure TCustomQueryModel.Finit;
begin
  FReportManager.Free;
  inherited Finit;
end;

procedure TCustomQueryModel.SubjectChanged(AOldSubject: TPressSubject);
begin
  inherited SubjectChanged(AOldSubject);
  if not Assigned(FReportManager) then
    FReportManager := TPressReportManager.Create(Self);
end;

{ TCustomEditPresenter }

procedure TCustomEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  BindCommand(TPressMVPSaveObjectCommand, 'SaveButton');
  BindCommand(TPressMVPCancelConfirmObjectCommand, 'CancelButton');
  Model.AddNotification([TPressMVPObjectModelCanSaveEvent],
    {$IFDEF FPC}@{$ENDIF}SaveEvent);
end;

class function TCustomEditPresenter.InternalModelClass: TPressMVPObjectModelClass;
begin
  Result := TCustomEditModel;
end;

procedure TCustomEditPresenter.SaveEvent(AEvent: TPressEvent);
var
  VSubject: TCustomObject;
  VEvent: TPressMVPObjectModelCanSaveEvent;
  VValidationErrors: TStringList;
begin
  if (Model.Subject is TCustomObject) = False then
    Exit;
  VSubject := Model.Subject as TCustomObject;
  VEvent := AEvent as TPressMVPObjectModelCanSaveEvent;
  VValidationErrors := TStringList.Create();
  try
    if not VSubject.Validate(VValidationErrors) then
      Application.MessageBox(PChar('Há dados inválidos, corrija antes ' +
        'de salvar:'#13#10 + VValidationErrors.Text),
        'Validação dos dados', MB_ICONERROR);
  finally
    VEvent.CanSave := VValidationErrors.Count = 0;
    VValidationErrors.Free;
  end;

end;

{ TCustomQueryPresenter }

procedure TCustomQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  BindCommand(TPressMVPExecuteQueryCommand, 'SearchButton');
  FMainQueryPresenter := CreateQueryItemsPresenter('QueryStringGrid');
  FMainQueryPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddButton');
  FMainQueryPresenter.BindCommand(TPressMVPEditItemCommand, 'EditButton');
  FMainQueryPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveButton');
end;

class function TCustomQueryPresenter.InternalModelClass: TPressMVPObjectModelClass;
begin
  Result := TCustomQueryModel;
end;

initialization
  TCustomEditPresenter.RegisterBO(TCustomObject);
  TCustomQueryPresenter.RegisterBO(TCustomQuery);

end.

