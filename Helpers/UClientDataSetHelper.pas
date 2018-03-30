unit UClientDataSetHelper;

interface

uses System.Classes, Datasnap.DBClient, Data.DB;

type
  TCallBackIterateFields = reference to procedure(field: TField; out stop : boolean);

  TClientDataSetHelper = class helper for TClientDataSet
  private
    function GetKeyValue: Variant;
    procedure SetKeyValue(const Value: Variant);
    procedure IterateFields(callBack: TCallBackIterateFields);
  public
    property KeyValue: Variant read GetKeyValue write SetKeyValue;

    function InEditModes(): Boolean;
    function GetRequiredFieldNames(): TStringList;
    function ValidateRequiredFields(const showMessage: Boolean = false): Boolean;
    function GetKeyName(): String;
    function GetMaxKeyValue(): Variant;

    procedure InsertOrEdit();
    procedure Insert();
    procedure Delete(const applyUpdate: Boolean = true);
    procedure Edit();
    procedure Cancel();
    function Save(const UserRequiredFieldsValidation: Boolean = true; const showSuccesMessage: Boolean = true): Boolean;
    procedure Reload();
  end;

implementation

uses System.SysUtils, System.StrUtils, System.Variants, UStringHelper;

{ TClientDataSetHelper }

function TClientDataSetHelper.GetKeyValue: Variant;
begin
  Result := FieldByName(GetKeyName()).Value;
end;

procedure TClientDataSetHelper.SetKeyValue(const Value: Variant);
begin
  FieldByName(GetKeyName()).Value := Value;
end;

function TClientDataSetHelper.InEditModes: Boolean;
begin
  Result := State in dsEditModes;
end;

function TClientDataSetHelper.GetRequiredFieldNames: TStringList;
var
  retorno: TStringList;
begin
  retorno := TStringList.Create();

  IterateFields(procedure(field: TField; out stop : boolean)
                begin
                  if field.Required and field.IsNull then
                    retorno.Add(IfThen(field.DisplayLabel.IsNotEmpty(), field.DisplayName, field.FieldName));
                end);

  Result := retorno;
end;

function TClientDataSetHelper.ValidateRequiredFields(const showMessage : Boolean): Boolean;
var
  hasRequiredEmpty: Boolean;
begin
  IterateFields(procedure (field: TField; out stop : boolean)
                begin
                  if (field.Required) and ((field.IsNull) or (field.AsString.IsEmpty())) then
                  begin
                    hasRequiredEmpty := True;
                    stop := true;
                  end;
                end);

  if hasRequiredEmpty and showMessage then
  begin
    // TMessage.Instance().Alert(GetRequiredFieldNames());
  end;

  Result := hasRequiredEmpty;
end;

function TClientDataSetHelper.GetKeyName: String;
var
  keyName: string;
begin
  keyName := EmptyStr;
  IterateFields(procedure(field: TField; out stop: Boolean)
                begin
                  if pfInKey in field.ProviderFlags then
                  begin
                    stop := true;
                    keyName := field.FieldName;
                  end;
                end);
  exit(keyName);
end;

function TClientDataSetHelper.GetMaxKeyValue: Variant;
const INTGR_MINIMUM_ID = 1;
      INTGR_MINIMUM_RECORDS = 1;
var currentIdValue : variant;
    value : Variant;
begin
  if (not Self.Active) then
    exit(INTGR_MINIMUM_ID);

  if RecordCount <= INTGR_MINIMUM_RECORDS then
  begin
    currentIdValue := GetKeyValue();
    if currentIdValue = Null then
      exit(INTGR_MINIMUM_ID);

    exit(currentIdValue);
  end;

  DisableControls();
  try
    value := INTGR_MINIMUM_ID;
    First();
    while (not Eof) do
    begin
      currentIdValue := GetKeyValue();
      if (currentIdValue <> Null) and (value < currentIdValue) then
        value := currentIdValue;
      Next();
    end;
  finally
    EnableControls();
    exit(value);
  end;
end;

procedure TClientDataSetHelper.InsertOrEdit;
begin

end;

procedure TClientDataSetHelper.Insert;
begin

end;

procedure TClientDataSetHelper.Edit;
begin

end;

procedure TClientDataSetHelper.Delete(const applyUpdate: Boolean);
begin

end;

procedure TClientDataSetHelper.Cancel;
begin

end;

function TClientDataSetHelper.Save(const UserRequiredFieldsValidation, showSuccesMessage: Boolean): Boolean;
begin
  try
    releaseReadOnly();


  //    releaseReadOnly().repareToSave().

  except on E: Exception do
  //TMensagem.Instancia.AlertaErro('Erro ao Gravar dos dados: ' + e.Message);
  end;
end;

procedure TClientDataSetHelper.Reload();
begin
  Close();
  Open();
end;

procedure TClientDataSetHelper.IterateFields(callBack: TCallBackIterateFields);
var
  I: Integer;
  field: TField;
  doStop : Boolean;
begin
  for I := 0 to FieldList.Count - 1 do
  begin
    field := FieldList[I];
    callBack(field, doStop);
    if doStop then
      Break;
  end;
end;

end.
