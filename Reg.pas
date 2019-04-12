unit Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Buttons, Registry,Shellapi, ImgList, ComCtrls, DB,
  DBClient, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1Editor: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ListaProgramasInstalados;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}

procedure TForm1.ListaProgramasInstalados;
Var
  List:TStringList;
  Registry : TRegistry;
  I,J:Integer;
  DisplayName,Publisher :String;
  const cRegistroAplicacoes = 'Software\Microsoft\Windows\CurrentVersion\Uninstall';
begin
  ClientDataSet1.EmptyDataSet;
  Registry := TRegistry.Create(KEY_ALL_ACCESS OR $0100);
  List := TStringList.Create;

  try
    with Registry do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey(cRegistroAplicacoes,False) Then
      Begin
        GetKeyNames(List);
        CloseKey;
      End;

      for i:=0 to List.Count-1 do
      begin
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(cRegistroAplicacoes+'\'+List[i],False) then
        begin
          DisplayName := ReadString('DisplayName');
          Publisher   := ReadString('Publisher');
          if (DisplayName <> '') and ((AnsiContainsText(UpperCase(Publisher),'TECNOSPEED')) or not (CheckBox1.Checked)) then
          begin
            ClientDataSet1.Append;
            ClientDataSet1Nome.AsString := DisplayName;
            ClientDataSet1Editor.AsString := Publisher;
            ClientDataSet1.CheckBrowseMode;
          end;
        end;
        CloseKey;
      End;
    end;
  Finally
    Registry.Free;
    List.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ListaProgramasInstalados;
  Label1.Caption := IntToStr(ClientDataSet1.RecordCount)+' programas instalados em seu computador.';
end;

end.