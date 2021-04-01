unit numedit;

interface

uses
  Winapi.Messages, System.SysUtils, System.Classes, Vcl.ClipBrd, Vcl.StdCtrls;

type
  TEMreplaceSel = TWMSettext;

  TFilteredEdit = class(TEdit)
  private
    Procedure WMPaste(Var msg: TMessage); message WM_PASTE;
    Procedure WMSetText(Var msg: TWMSettext); message WM_SETTEXT;
    Procedure EMReplaceSel(Var msg: TEMreplaceSel); message EM_REPLACESEL;
  protected
    procedure KeyPress(var Key: Char); override;
    function IsCharValid(ch: Char): Boolean; virtual; abstract;
    function IsStringValid(const S: String): Boolean;
  end;

  TNumberEdit = class(TFilteredEdit)
  protected
    function IsCharValid(ch: Char): Boolean; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('PBGoodies', [TNumberEdit]);
end;

procedure TFilteredEdit.EMReplaceSel(var msg: TEMreplaceSel);
begin
  if IsStringValid(msg.Text) then
    inherited;
end;

function TFilteredEdit.IsStringValid(const S: String): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 1 to Length(S) do
    if not IsCharValid(S[i]) then
    begin
      Result := False;
      Break;
    end;
end;

procedure TFilteredEdit.KeyPress(var Key: Char);
begin
  if IsCharValid(Key) or CharInSet(Key, [#8, ^V]) then
    inherited
  else
    Key := #0;
end;

procedure TFilteredEdit.WMPaste(var msg: TMessage);
begin
  if IsStringValid(Clipboard.AsText) then
    inherited;
end;

procedure TFilteredEdit.WMSetText(var msg: TWMSettext);
begin
  if IsStringValid(msg.Text) then
    inherited;
end;

function TNumberEdit.IsCharValid(ch: Char): Boolean;
begin
  Result := CharInSet(ch, [#48 .. #57]);
end;

end.
