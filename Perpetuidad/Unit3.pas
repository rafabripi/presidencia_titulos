unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit2, Unit4;

procedure TForm3.Button1Click(Sender: TObject);
begin
 Form3.Close;
end;

procedure TForm3.DBGrid1DblClick(Sender: TObject);
begin
   Form4.ShowModal;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
     DataModule1.Querybuscarnombrefellecido.Close;
     DataModule1.Querybuscarnombrefellecido.ParamByName('fallecido').AsString := Form3.Edit1.Text + '%';
     DataModule1.Querybuscarnombrefellecido.Open;
       if DataModule1.Querybuscarnombrefellecido.EOF then
        begin
           Form3.DBGrid1.Visible:=false;
           DataModule1.ClientDataSet2.Refresh;
        end
        else
        begin
        Form3.DBGrid1.Visible:=true;
        DataModule1.ClientDataSet2.Refresh;
        end;
end;

end.
