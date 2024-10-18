unit TesteWK.Model.Behaviors;

interface

uses
  System.SysUtils,
  System.UITypes;

type

  TModelBehaviors = class
  private
    procedure BehaviorsException(Sender: TObject; E: Exception);
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  ModelBehaviors : TModelBehaviors;

implementation

uses
  Vcl.Forms, Vcl.Dialogs;

{ TModelBehaviors }

procedure TModelBehaviors.BehaviorsException(Sender: TObject; E: Exception);
begin
  MessageDlg(E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
end;

constructor TModelBehaviors.Create;
begin
  ReportMemoryLeaksOnShutdown := True;
  Application.OnException := BehaviorsException;
end;

destructor TModelBehaviors.Destroy;
begin

  inherited;
end;

initialization
  ModelBehaviors := TModelBehaviors.Create;

finalization
  ModelBehaviors.Free;

end.
