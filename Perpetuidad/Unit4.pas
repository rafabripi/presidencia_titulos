unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit2, Unit1;

 // Convierte números a letras de forma recursiva
function NumbersToLetters(Number: Double) : String;
const
  Digit: array[1..9] of String = (' Uno', 'Dos', 'Tres',
                                  'Cuatro', 'Cinco', 'Seis',
                                  'Siete', 'Ocho', 'Nueve');

  Numeral: array[11..19] of String = ('Once', 'Doce', 'Trece',
                                      'Catorce', 'Quince', 'Diez y Seis',
                                      'Diez y Siete', 'Diez y Ocho', 'Diez y Nueve');

  Tenths: array[1..9] of String = ('Diez', 'Veinte', 'Trienta',
                                   'Cuarenta', 'Cincuenta', 'Sesenta',
                                   'Setenta', 'Ochenta', 'Noventa');

  Hundreds : array[1..9] of String = ('Cien ', 'Docientos ', 'Trecientos ',
                                      'Cuatrocientos ', 'Quinientos ', 'Seicientos ',
                                      'Setecientos ', 'Ochocientos ', 'Novecientos ');

  Min = 1;
  Max = 4294967295;

   function RecursiveNumber(N: LongWord) : String;
  begin

    case N of

      1..9:
      begin
         Result := Digit[N];
      end;

      11..19:
      begin
         Result := Numeral[N]
      end;

      10,20..99:
      begin
         if (N Mod 10) = 0 then
            Result := Tenths[N div 10] + RecursiveNumber(N mod 10)
         else
            Result := Tenths[N div 10] + ' y '  + RecursiveNumber(N mod 10);
      end;

      100..999:
      begin
        if (N = 100) or (N >= 200) then Result := Hundreds[N div 100] + RecursiveNumber(N mod 100);
        if (N > 100) and (N < 200) then Result := 'Ciento ' + RecursiveNumber(N mod 100);
      end;

      1000..999999:
      begin
         if (Number >= 1000) and (Number < 2000) then
            Result := 'Un Mil ' + RecursiveNumber(N mod 1000)
         else
            Result := RecursiveNumber(N div 1000) + ' Mil ' + RecursiveNumber(N mod 1000);
      end;

      1000000..999999999:
      begin
         if (Number >= 1000000) and (Number < 2000000) then
            Result := 'Un Millon ' + RecursiveNumber(N mod 1000000)
         else
            Result := RecursiveNumber(N div 1000000) + ' Millones ' + RecursiveNumber(N mod 1000000);
      end;

      1000000000..4294967295:
      begin
         if (Number >= 1000000000) and (Number < 2000000000) then
            Result := 'Un Billon ' + RecursiveNumber(N mod 1000000)
         else
            Result := RecursiveNumber(N div 1000000000) + ' Billones ' + RecursiveNumber(N mod 1000000000);
      end;

    end;

  end;

begin
  if (Number >= Min) and (Number <= Max) then
     begin
        Result := RecursiveNumber(Trunc(Number));
        Result := Result +  ' Pesos ' + FormatFloat('00',Frac(Number) * 100) + '/100 MN )';
     end
  else
     Result := '-1';
end;
procedure TForm4.Button1Click(Sender: TObject);
begin
  Form4.Close;
end;

procedure TForm4.Button2Click(Sender: TObject);
Var
fecharecibo1, diaexp,mesexp,yearexp, presidente, tesorero, secretario :string;
fechatitulo, fecharecibo : TDateTime;
begin
fechatitulo := strToDate(Form4.DBEdit7.Text);
fecharecibo := strToDate(Form4.DBEdit6.Text);
presidente:= DataModule1.ClientDataSet2presidente.Value;
secretario:= DataModule1.ClientDataSet2secretario.Value;
tesorero:= DataModule1.ClientDataSet2tesorero.Value;


  if Application.MessageBox(PChar('¿Deseas Imprimir el Titulo?' )  , 'Imprimir Titulo',
           MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
       Begin
        diaexp:= FormatDateTime('dd', fechatitulo);
        mesexp:= FormatDateTime('MMMM', fechatitulo);
        yearexp:= FormatDateTime('yy', fechatitulo);

       fecharecibo1:= FormatDateTime('dd / mmmm / yyyy',fecharecibo);

         Form1.frxReport1.Variables.Variables['sepulcro']:= QuotedStr(Form4.DBEdit8.Text);
         Form1.frxReport1.Variables.Variables['seccion']:=  QuotedStr(Form4.DBEdit11.Text);
         Form1.frxReport1.Variables.Variables['panteon']:=  QuotedStr(Form4.DBEdit3.Text);
         Form1.frxReport1.Variables.Variables['solicitante']:= QuotedStr(Form4.DBEdit2.Text);;
         Form1.frxReport1.Variables.Variables['fila']:=  QuotedStr(Form4.DBEdit9.Text);
         Form1.frxReport1.Variables.Variables['lote']:=  QuotedStr(Form4.DBEdit8.Text);
         Form1.frxReport1.Variables.Variables['tipo']:=  QuotedStr(Form4.DBEdit10.Text);
         Form1.frxReport1.Variables.Variables['fallecido']:= QuotedStr(Form4.DBEdit1.Text);
         Form1.frxReport1.Variables.Variables['cantidad']:= QuotedStr(Form4.DBEdit5.Text);
         Form1.frxReport1.Variables.Variables['letra']:=  QuotedStr(Form4.Edit1.Text);
         Form1.frxReport1.Variables.Variables['presidente']:= QuotedStr(Form1.Edit11.Text);
         Form1.frxReport1.Variables.Variables['tesorero']:= QuotedStr(Form1.Edit12.Text);
         Form1.frxReport1.Variables.Variables['secretario']:= QuotedStr(Form1.Edit13.Text);
         Form1.frxReport1.Variables.Variables['recibo']:= QuotedStr(Form4.DBEdit4.Text);
         Form1.frxReport1.Variables.Variables['fecharecibo']:= QuotedStr(AnsiUpperCase(fecharecibo1));

         Form1.frxReport1.Variables.Variables['diaexp1']:= QuotedStr(diaexp);
         Form1.frxReport1.Variables.Variables['mesexp1']:= QuotedStr(AnsiUpperCase(mesexp));
         Form1.frxReport1.Variables.Variables['yearexp1']:= QuotedStr(yearexp);
         Form1.frxReport1.ShowReport;
       end
       else
       begin

       end;
end;

procedure TForm4.FormActivate(Sender: TObject);
var
   Number : Double;
begin
   if TryStrToFloat(Form4.DBEdit5.Text,Number) then
      Form4.Edit1.Text := NumbersToLetters(Number)
   else
      MessageDlg('Error en formato de Número',mtError,[mbOK],0);
end;

end.
