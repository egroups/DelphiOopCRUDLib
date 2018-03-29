unit UCustomEditHelper;

interface

uses Vcl.StdCtrls;

type
  TCustomEditHelper = class helper for TCustomEdit
    procedure RemoveAccents();
    procedure TrimSpaces();
    procedure RemoveSpecialCaracters();
    function IsEmpty(): Boolean;
    function IsNotEmpty(): Boolean;
    procedure ToUpper();
    procedure ToLower();
    procedure Replace(const old: string; const new: string = '');
    function HasWord(const word: string): Boolean;
  end;

implementation

uses UStringHelper;

{ TCustomEditHelper }

procedure TCustomEditHelper.RemoveAccents;
begin
  Text := String(Text).RemoveAccents();
end;

procedure TCustomEditHelper.TrimSpaces;
begin
  Text := String(Text).TrimSpaces();
end;

procedure TCustomEditHelper.RemoveSpecialCaracters;
begin
  Text := String(Text).RemoveSpecialCaracters();
end;

function TCustomEditHelper.IsEmpty: Boolean;
begin
  Result := String(Text).IsEmpty();
end;

function TCustomEditHelper.IsNotEmpty: Boolean;
begin
  Result := String(Text).IsNotEmpty();
end;

procedure TCustomEditHelper.ToUpper;
begin
  Text := String(Text).ToUpper();
end;

procedure TCustomEditHelper.ToLower;
begin
  Text := String(Text).ToLower();
end;

procedure TCustomEditHelper.Replace(const old, new: string);
begin
  Text := String(Text).Replace(old, new);
end;

function TCustomEditHelper.HasWord(const word: string): Boolean;
begin
  Result := String(Text).HasWord(word);
end;

end.
