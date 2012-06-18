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
  protected
    procedure InitPresenter; override;
    class function InternalModelClass: TPressMVPObjectModelClass; override;
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
  PressMVPCommand,
  CustomBO;

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
begin
  if (Model.Subject is TCustomObject) = False then
    Exit;
  VSubject := Model.Subject as TCustomObject;
  VEvent := AEvent as TPressMVPObjectModelCanSaveEvent;
  VEvent.CanSave := VSubject.Validate;
end;

{ TCustomQueryPresenter }

procedure TCustomQueryPresenter.InitPresenter;
var
  VItemsPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  BindCommand(TPressMVPExecuteQueryCommand, 'SearchButton');
  VItemsPresenter := CreateQueryItemsPresenter('QueryStringGrid');
  VItemsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddButton');
  VItemsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditButton');
  VItemsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveButton');
end;

class function TCustomQueryPresenter.InternalModelClass: TPressMVPObjectModelClass;
begin
  Result := TCustomQueryModel;
end;

initialization
  TCustomEditPresenter.RegisterBO(TCustomObject);
  TCustomQueryPresenter.RegisterBO(TCustomQuery);

end.

