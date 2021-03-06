unit UAddToCategory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFAddToCategory = class(TForm)
    lstCreatedCategory: TListBox;
    lblCreatedCategory: TLabel;
    lblNewCategory: TLabel;
    edtNewCategory: TEdit;
    pnlButtons: TPanel;
    btnSave: TBitBtn;
    btnDeleteCategory: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure lstCreatedCategoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddToCategory: TFAddToCategory;
  boolChoice: Boolean = False;
implementation

uses UMain;

{$R *.dfm}

procedure TFAddToCategory.btnSaveClick(Sender: TObject);
var
  vCategoryFile: TextFile;
begin
  if (boolChoice = True) and (Length(edtNewCategory.Text) <> 0) then
  // If clicked in list of names and edit isn`t empty.
    if MessageDlg(('������� �������� ' +
      lstCreatedCategory.Items[lstCreatedCategory.ItemIndex] + '?'),
        mtWarning, mbYesNo, 0) = mrYes  then
    begin
      // If use lstCreatedcategory name of category.
      AssignFile(vCategoryFile,ExtractFilePath(ParamStr(0)) + 'data\category\' +
        lstCreatedCategory.Items[lstCreatedCategory.ItemIndex] + '.txt');
      Append(vCategoryFile);
      Writeln(vCategoryFile, FMain.qryStatistic.FieldByName('S_Title').AsString);
      CloseFile(vCategoryFile);
    end
    else
    begin
      // If use edtNewCategory name of category.
      AssignFile(vCategoryFile,ExtractFilePath(ParamStr(0)) + 'data\category\' +
        edtNewCategory.Text + '.txt');
      Rewrite(vCategoryFile);
      Writeln(vCategoryFile, FMain.qryStatistic.FieldByName('S_Title').AsString);
      CloseFile(vCategoryFile);
    end
  else if (boolChoice = True) and (Length(edtNewCategory.Text) = 0) then
  begin
    // If choice from list box.
    AssignFile(vCategoryFile, ExtractFilePath(ParamStr(0)) + 'data\category\' +
      lstCreatedCategory.Items[lstCreatedCategory.ItemIndex] + '.txt');
    Append(vCategoryFile);
    Writeln(vCategoryFile, FMain.qryStatistic.FieldByName('S_Title').AsString);
    CloseFile(vCategoryFile);
  end
  else if (boolChoice = False) and (Length(edtNewCategory.Text) <> 0) then
  begin
    //If choice from edit.
    AssignFile(vCategoryFile, ExtractFilePath(ParamStr(0)) + 'data\category\' +
      edtNewCategory.Text + '.txt');
    Rewrite(vCategoryFile);
    Writeln(vCategoryFile, FMain.qryStatistic.FieldByName('S_Title').AsString);
    CloseFile(vCategoryFile);
  end;

  edtNewCategory.Clear;
  FAddToCategory.Close;
end;

procedure TFAddToCategory.FormShow(Sender: TObject);
var
  sr: TSearchRec;
begin
  lstCreatedCategory.Clear;
  lstCreatedCategory.Enabled := True;
  // Find all *.txt files.
  if FindFirst('data\category\*.txt', faAnyFile, sr) = 0 then
  begin
    repeat
      lstCreatedCategory.Items.Add(FMain.ExtractFileNameEX(sr.Name));
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  // Check if listBox empty, and add warning about this.
  if lstCreatedCategory.Items.Count = 0 then
  begin
    lstCreatedCategory.Items.Add('���� ��������� ��������');
    lstCreatedCategory.Enabled := False;
  end;
end;

procedure TFAddToCategory.lstCreatedCategoryClick(Sender: TObject);
begin
  boolChoice := True;
end;

end.
