unit UPassCheck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFPassCheck = class(TForm)
    edtPassword: TEdit;
    btnOK: TBitBtn;
    btnClose: TBitBtn;
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPassCheck: TFPassCheck;

implementation

{$R *.dfm}

procedure TFPassCheck.btnCloseClick(Sender: TObject);
begin
  edtPassword.Clear;
end;

procedure TFPassCheck.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFPassCheck.edtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    btnOK.Click;
end;

procedure TFPassCheck.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', 'A'..'Z', 'a'..'z', #8, #13]) then
  begin
    Key:=#0;
    MessageBox(handle, PChar('��������� ������� ����'+ #10+#13+'�������� ����� �� �����'),PChar(''), MB_ICONWARNING+MB_OK);
  end;
end;

procedure TFPassCheck.FormShow(Sender: TObject);
begin
  edtPassword.Clear;
  edtPassword.SetFocus;
end;


end.
