unit UGlobal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
    System.DateUtils, System.IniFiles,
    UMain;

function PasswordCheck: Boolean;
function IsAdmin: Boolean;

const
  SECURITY_NT_AUTHORITY: TSIDIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5));
  SECURITY_BUILTIN_DOMAIN_RID = $00000020;
  DOMAIN_ALIAS_RID_ADMINS = $00000220;

implementation

procedure Code(s:string);
var
  i:integer;
  f: TextFile;
  vCode: string;
begin
  AssignFile(f,'version');
  Rewrite(f);
  for i := 1 to Length(s) do
  begin
    vCode := FloatToStr(Ord(s[i]) / 2.5);
    WriteLn(f,vCode);
  end;
  CloseFile(f);
  FileSetAttr('version', faReadOnly or faHidden or faSysFile);
end;

function Decode(): string;
var
  f: TextFile;
  s: string;
  i: Byte;
begin
  Result := '';
  AssignFile(f,'version');
  Reset(f);
  while not(Eof(f)) do
  begin
    Readln(f,s);
    i := Round(StrToFloat(s)*2.5);
    Result := Result + Chr(i);
  end;
  CloseFile(F);
end;

function PasswordCheck: Boolean;
var
  vSavedPassword: string;
  vTypedPassword: string;
  IniFile: TIniFile;
begin
  FMain.tmrMain.Enabled := False;
  if FileExists('version') then
  begin
    vSavedPassword := Decode();
    vTypedPassword := InputBox('','������ ������','');
    if vTypedPassword = vSavedPassword then
      PasswordCheck := True
    else
      PasswordCheck := False;
  end
  else
  begin
    repeat
      vTypedPassword := InputBox('', '������� ������', '');
      if MessageDlg('�� �������� � �����: "'+vTypedPassword+'"?',
        mtConfirmation,mbYesNo,0) = mrYes then
        Code(vTypedPassword)
      else
        vTypedPassword := '';
    until Length(vTypedPassword) > 0;
    PasswordCheck := True;
  end;
  FMain.tmrMain.Enabled := True;
end;

function IsAdmin: Boolean;
var
 hAccessToken: THandle;
 ptgGroups: PTokenGroups;
 dwInfoBufferSize: DWORD;
 psidAdministrators: PSID;
 x: Integer;
 bSuccess: BOOL;
begin
 Result   := False;
 bSuccess := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True,
   hAccessToken);
 if not bSuccess then
 begin
   if GetLastError = ERROR_NO_TOKEN then
     bSuccess := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY,
       hAccessToken);
 end;
 if bSuccess then
 begin
   GetMem(ptgGroups, 1024);
   bSuccess := GetTokenInformation(hAccessToken, TokenGroups,
     ptgGroups, 1024, dwInfoBufferSize);
   CloseHandle(hAccessToken);
   if bSuccess then
   begin
     AllocateAndInitializeSid(SECURITY_NT_AUTHORITY, 2,
       SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS,
       0, 0, 0, 0, 0, 0, psidAdministrators);
     {$R-}
     for x := 0 to ptgGroups.GroupCount - 1 do
       if EqualSid(psidAdministrators, ptgGroups.Groups[x].Sid) then
       begin
         Result := True;
         Break;
       end;
     {$R+}
     FreeSid(psidAdministrators);
   end;
   FreeMem(ptgGroups);
 end;
end;

end.
