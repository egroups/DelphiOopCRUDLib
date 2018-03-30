unit UComboboxHelper;

interface

uses Vcl.StdCtrls, System.Classes;

type
  TComboboxHelper = class helper for TCustomCombo
    procedure AddList(const list: TStringList; const firstItemEmpty: Boolean = false);
  end;

implementation

uses System.SysUtils;

{ TComboboxHelper }

procedure TComboboxHelper.AddList(const list: TStringList; const firstItemEmpty: Boolean = false);
begin
  Self.Items.Clear();
  if (firstItemEmpty) then
  begin
    Self.Items.Add(EmptyStr);
  end;

  Self.Items.AddStrings(list);
end;

end.
