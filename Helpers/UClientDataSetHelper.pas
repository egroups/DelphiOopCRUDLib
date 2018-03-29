unit UClientDataSetHelper;

interface

uses System.Classes, Datasnap.DBClient;

type
  TClientDataSetHelper = class helper for TClientDataSet
  private
    function GetKeyValue: Variant;
    procedure SetKeyValue(const Value: Variant);

  public
    property KeyValue: Variant read GetKeyValue write SetKeyValue;

    function InEditModes(): Boolean;
    function GetRequiredFieldNames(): TStringList;
    function ValidateRequiredFields(const showMessage: Boolean = false) : Boolean;
    function GetKeyName(): Variant;
    function GetMaxKeyValue(): Variant;

    procedure InsertOrEdit();
    procedure Insert();
    procedure Delete(const applyUpdate: Boolean = true);
    procedure Edit();
    procedure Cancel();
    function Save(const ValidateRequiredFields: Boolean = true; const showSuccesMessage: Boolean = true): Boolean;
    procedure Reload(const reconnect: Boolean = false);
  end;

implementation

{ TClientDataSetHelper }

function TClientDataSetHelper.GetKeyValue: Variant;
begin

end;

procedure TClientDataSetHelper.SetKeyValue(const Value: Variant);
begin

end;

function TClientDataSetHelper.InEditModes: Boolean;
begin

end;

function TClientDataSetHelper.GetRequiredFieldNames: TStringList;
begin

end;

function TClientDataSetHelper.ValidateRequiredFields(const showMessage
  : Boolean): Boolean;
begin

end;

function TClientDataSetHelper.GetKeyName: Variant;
begin

end;

function TClientDataSetHelper.GetMaxKeyValue: Variant;
begin

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

function TClientDataSetHelper.Save(const ValidateRequiredFields, showSuccesMessage: Boolean): Boolean;
begin

end;

procedure TClientDataSetHelper.Reload(const reconnect: Boolean);
begin

end;

end.
