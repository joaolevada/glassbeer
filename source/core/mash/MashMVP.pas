unit MashMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  Mash;

type

  { TMashEditPresenter }

  TMashEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashQueryPresenter }

  TMashQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

implementation

{ TMashQueryPresenter }

procedure TMashQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TMashQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome");' +
    'Amount(99, "Quantidade")';
end;

{ TMashEditPresenter }

procedure TMashEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('MashItems', 'MashItemsGrid');
  CreateSubPresenter('AverageOriginalGravity', 'AverageOriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
  CreateSubPresenter('Amount', 'AmountEdit');
  CreateSubPresenter('Fermenters', 'FermentersGrid');
end;

initialization
  TMashEditPresenter.RegisterBO(TMash);
  TMashQueryPresenter.RegisterBO(TMashQuery);

end.

