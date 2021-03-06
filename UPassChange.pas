unit UPassChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFPassChange = class(TForm)
    edtOldPass: TEdit;
    edtNewPass: TEdit;
    edtReEnterNewPass: TEdit;
    btnAccept: TBitBtn;
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPassChange: TFPassChange;

implementation

uses USecurity;

{$R *.dfm}

procedure TFPassChange.btnAcceptClick(Sender: TObject);
var
  vOldPass: string;
  vEnteredNewPass: string;
  vReEnteredNewPass: string;
begin
  vOldPass := edtOldPass.Text;
  vEnteredNewPass := edtNewPass.Text;
  vReEnteredNewPass := edtReEnterNewPass.Text;

  if vEnteredNewPass = vReEnteredNewPass then
  begin
    if vOldPass = DecodePassword() then
    begin
      FileSetAttr(ExtractFilePath(ParamStr(0)) + 'version',
        not(faReadOnly or faHidden or faSysFile));
      USecurity.CodePassword(vEnteredNewPass);
      FPassChange.Close;
    end
    else
      MessageBox(handle, PChar('������ ������� �� ���������'),
        PChar(''), MB_OK+MB_ICONERROR);
  end
  else
    MessageBox(handle, PChar('��� ����� �� ����������'),
        PChar(''), MB_OK+MB_ICONERROR);
end;

end.
