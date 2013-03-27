unit ReportMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  PressMVPModel,
  PressMVPCommand,
  CustomMVP;

type

  { TReportGroupEditPresenter }

  TReportGroupEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TReportItemEditModel }

  TReportItemEditModel = class(TPressMVPObjectModel)
  protected
    procedure InitCommands; override;
  end;

  { TReportItemEditPresenter }

  TReportItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
    class function InternalModelClass: TPressMVPObjectModelClass; override;
  end;

  { TDesignReportCommand }

  TDesignReportCommand = class(TPressMVPObjectCommand)
  protected
    function GetCaption: string; override;
    function GetShortCut: TShortCut; override;
    procedure InternalExecute; override;
  end;

implementation

uses
  LCLType,
  PressReport,
  PressReportModel,
  PressMVPPresenter;

{ TDesignReportCommand }

function TDesignReportCommand.GetCaption: string;
begin
  Result := 'Desenhar relatório';
end;

function TDesignReportCommand.GetShortCut: TShortCut;
begin
  Result := VK_F8;
end;

procedure TDesignReportCommand.InternalExecute;
begin
  (Model.Subject as TPressCustomReportItem).Design;
end;

{ TReportItemEditPresenter }

procedure TReportItemEditPresenter.InitPresenter;
begin
  inherited;
  CreateSubPresenter('Caption', 'CaptionEdit');
  CreateSubPresenter('Visible', 'VisibleCheckBox');
  BindCommand(TDesignReportCommand, 'DesignButton');
end;

class function TReportItemEditPresenter.InternalModelClass: TPressMVPObjectModelClass;
begin
  Result := TReportItemEditModel;
end;

{ TReportItemEditModel }

procedure TReportItemEditModel.InitCommands;
begin
  inherited;
  AddCommands([TDesignReportCommand]);
end;

{ TReportGroupEditPresenter }

procedure TReportGroupEditPresenter.InitPresenter;
var
  VReportsPresenter: TPressMVPItemsPresenter;
begin
  inherited;
  VReportsPresenter := CreateSubPresenter('Reports',
    'ReportsStringGrid',
    'Caption(160, "Nome do relatório");Visible(32, "Visível")') as TPressMVPItemsPresenter;
  VReportsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddReportButton');
  VReportsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditReportButton');
  VReportsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveReportButton');
end;

initialization
  TReportGroupEditPresenter.RegisterBO(TPressReportGroup);
  TReportItemEditPresenter.RegisterBO(TPressReportItem);

end.

