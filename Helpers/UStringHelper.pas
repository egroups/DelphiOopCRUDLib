unit UStringHelper;

interface

type
  TStringHelper = record helper for string
    function TrimSpaces(): string;
    function RemoveAccents(): string;
    function RemoveSpecialCaracters(): string;
    function ToUpper(): string;
    function ToLower(): string;
    function IsEmpty(): Boolean;
    function IsNotEmpty(): Boolean;
    function OnlyNumbers() : Integer;
    function Replace(const old: string; const new: string = ''): string;
    function HasWord(const word: string): Boolean;
  end;

implementation

uses System.SysUtils, System.StrUtils, System.RegularExpressions;

{ TStringHelper }

function TStringHelper.TrimSpaces: string;
begin
  Result := Trim(Self);
end;

function TStringHelper.RemoveAccents: string;
begin
  Self := TRegEx.Replace(Self, '[������]', 'A');
  Self := TRegEx.Replace(Self, '[����]'  , 'E');
  Self := TRegEx.Replace(Self, '[����]'  , 'I');
  Self := TRegEx.Replace(Self, '[�����]' , 'O');
  Self := TRegEx.Replace(Self, '[���]'   , 'U');
  Self := TRegEx.Replace(Self, '[�]'     , 'C');

  Self := TRegEx.Replace(Self, '[�����]' , 'a');
  Self := TRegEx.Replace(Self, '[����]'  , 'e');
  Self := TRegEx.Replace(Self, '[����]'  , 'i');
  Self := TRegEx.Replace(Self, '[�����]' , 'o');
  Self := TRegEx.Replace(Self, '[����]'  , 'u');
  Self := TRegEx.Replace(Self, '[�]'     , 'c');
  Result := Self;
end;

function TStringHelper.RemoveSpecialCaracters: string;
begin
  Result := TRegEx.Replace(Self.RemoveAccents(), '[^0-9a-zA-Z]+', EmptyStr);
end;

function TStringHelper.ToUpper: string;
begin
  Result := UpperCase(Self);
end;

function TStringHelper.ToLower: string;
begin
  Result := LowerCase(Self);
end;

function TStringHelper.IsEmpty: Boolean;
begin
  Result := Trim(Self) = EmptyStr;
end;

function TStringHelper.IsNotEmpty: Boolean;
begin
  Result := not IsEmpty();
end;

function TStringHelper.OnlyNumbers: Integer;
begin
  TryStrToInt(TRegEx.Replace(Self, '[^\d]', EmptyStr), Result);
end;

function TStringHelper.HasWord(const word: string): Boolean;
begin
  Result := ContainsStr(Self, word);
end;

function TStringHelper.Replace(const old, new: string): string;
begin
  Result := StringReplace(Self, old, new, [rfReplaceAll, rfIgnoreCase]);
end;

end.
