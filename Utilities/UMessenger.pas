unit UMessenger;

interface

uses Vcl.Dialogs, System.classes;

type
  TMessenger = class
  private
    class function BaseMessage(const strgMessage : string; const tpMessage : TMsgDlgType; const Buttons : TMsgDlgButtons = [mbOK]) : Integer;
  public
    class procedure Alert(const strgMessage : String); overload;
    class procedure Alert(const LstMessage : TStringList); overload;
    class procedure AlertInformation(const strgMessage : string);
    class procedure AlertDanger(const strgMessage : string);
    class procedure AlertError(const strgMessage : string);
    class function AlertQuestion(const strgMessage: string) : Boolean;
  end;

implementation

{ TMessenger }

class procedure TMessenger.Alert(const strgMessage: String);
begin

end;

class procedure TMessenger.Alert(const LstMessage: TStringList);
begin

end;

class procedure TMessenger.AlertDanger(const strgMessage: string);
begin

end;

class procedure TMessenger.AlertError(const strgMessage: string);
begin

end;

class procedure TMessenger.AlertInformation(const strgMessage: string);
begin

end;

class function TMessenger.AlertQuestion(const strgMessage: string): Boolean;
begin

end;

class function TMessenger.BaseMessage(const strgMessage: string; const tpMessage: TMsgDlgType; const Buttons: TMsgDlgButtons): Integer;
const INTGR_MESSAGE_HELP_CONTEX = 0;
begin
  Result := MessageDlg(strgMessage, tpMessage, Buttons, INTGR_MESSAGE_HELP_CONTEX);
end;

end.
