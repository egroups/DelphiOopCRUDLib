unit URttiHelper;

interface

type
  TRttiHelper = class
    class function MethodIsImplemented(const theClass: TClass; methodName: string): Boolean;
  end;

implementation

uses System.Rtti, System.SysUtils;

{ TRttiHelper }

class function TRttiHelper.MethodIsImplemented(const theClass: TClass; methodName: string): Boolean;
var
  method : TRttiMethod;
begin
  for method in TRttiContext.Create.GetType(theClass.ClassInfo).GetDeclaredMethods() do
  begin
    if (CompareText(method.Name, methodName) = 0) then
    begin
      Exit(true);
    end;
  end;

  Result := False;
end;

end.
