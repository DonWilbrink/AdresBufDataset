unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  StdCtrls, DB, BufDataset, typinfo;

type

  { TForm1 }

  TForm1 = class(TForm)
    BufDataset1: TBufDataset;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  if FileExists('adressen.bds') then
    BufDataset1.LoadFromFile('adressen.bds')
  else
  begin
    BufDataset1.CreateDataset;
    BufDataset1.SaveToFile('adressen.bds');
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  BufDataset1.SaveToFile('adressen.bds');
  CloseAction := caFree;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  BufDataset1.IndexFieldNames := Combobox1.Text;
  BufDataset1.First;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  BufDataset1.IndexFieldNames := Column.FieldName;
  BufDataset1.First;
end;

end.

