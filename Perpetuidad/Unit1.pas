unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, frxClass,
  Vcl.Mask,DateUtils, Vcl.Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    frxReport1: TfrxReport;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel4: TPanel;
    Label8: TLabel;
    Label16: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit6: TEdit;
    ComboBox2: TComboBox;
    Edit9: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    ComboBox3: TComboBox;
    ComboBox1: TComboBox;
    ComboBox6: TComboBox;
    ComboBox4: TComboBox;
    Panel5: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Consultas1: TMenuItem;
    Salir1: TMenuItem;
    Consultas2: TMenuItem;
    Label10: TLabel;
    Edit10: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Consultas2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3;
////////////////////////////////////////////////////////////////////////////////
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



////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var
fecharecibo1, diaexp,mesexp,yearexp :string;
begin
/////AGREGAR LOS DATOS A LA TABLA PRERPETUIDAD////////
///INICIO///
  if (Form1.Edit2.Text = '')or(Form1.Edit3.Text = '') then
    Begin
      ShowMessage('Escribe el Nombre del fallecido y el de el solicitante por favor!!');
    End
    else
    begin
       //Si se encuentran todos los datos, se procedera a guardar el registro en pago de membresisas
       //inicia el proceso de insercion del registro
    DataModule1.ClientDataSet1.Open;
    DataModule1.Queryagregartitulo.ParamByName('fallecido').Asstring := Form1.Edit2.Text;
    DataModule1.Queryagregartitulo.ParamByName('solicitante').Asstring := Form1.Edit3.Text;
    DataModule1.Queryagregartitulo.ParamByName('panteon').Asstring := Form1.ComboBox2.Text;
    DataModule1.Queryagregartitulo.ParamByName('recibo').Asstring := Form1.Edit10.Text;
    DataModule1.Queryagregartitulo.ParamByName('cantidad').AsFloat := strTofloat(Form1.Edit6.Text);
    DataModule1.Queryagregartitulo.ParamByName('fecharecibo').AsDate := Form1.DateTimePicker1.Date;
    DataModule1.Queryagregartitulo.ParamByName('fechatitulo').AsDate := Form1.DateTimePicker2.Date;
    DataModule1.Queryagregartitulo.ParamByName('sepulcro').Asstring := Form1.ComboBox3.Text;
    DataModule1.Queryagregartitulo.ParamByName('fila').Asstring := Form1.ComboBox4.Text;
    DataModule1.Queryagregartitulo.ParamByName('tipo').Asstring := Form1.ComboBox1.Text;
    DataModule1.Queryagregartitulo.ParamByName('seccion').Asstring := Form1.ComboBox6.Text;
    DataModule1.Queryagregartitulo.ParamByName('presidente').Asstring := Form1.Edit11.Text;
    DataModule1.Queryagregartitulo.ParamByName('secretario').Asstring := Form1.Edit12.Text;
    DataModule1.Queryagregartitulo.ParamByName('tesorero').Asstring := Form1.Edit13.Text;
    DataModule1.Queryagregartitulo.ExecSQL;
    DataModule1.ClientDataSet1.ApplyUpdates(0);
    DataModule1.Tperpetuidad.Refresh;
    DataModule1.ClientDataSet1.Refresh;
    ShowMessage('Titulo Guardado con Exito!');
    if Application.MessageBox(PChar('¿Deseas Imprimir el Titulo?' )  , 'Imprimir Titulo',
           MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
       Begin
        diaexp:= FormatDateTime('dd', DateTimePicker2.Date);
        mesexp:= FormatDateTime('MMMM', DateTimePicker2.Date);
        yearexp:= FormatDateTime('yy', DateTimePicker2.Date);

       fecharecibo1:= FormatDateTime('dd / mmmm / yyyy',Form1.DateTimePicker1.Date);

         Form1.frxReport1.Variables.Variables['sepulcro']:= QuotedStr(Form1.ComboBox3.Text);
         Form1.frxReport1.Variables.Variables['seccion']:= QuotedStr(Form1.ComboBox6.Text);
         Form1.frxReport1.Variables.Variables['panteon']:= QuotedStr(Form1.ComboBox2.Text);
         Form1.frxReport1.Variables.Variables['solicitante']:= QuotedStr(Form1.Edit3.Text);
         Form1.frxReport1.Variables.Variables['fila']:= QuotedStr(Form1.ComboBox4.Text);
         Form1.frxReport1.Variables.Variables['lote']:= QuotedStr(Form1.ComboBox3.Text);
         Form1.frxReport1.Variables.Variables['tipo']:= QuotedStr(Form1.ComboBox1.Text);
         Form1.frxReport1.Variables.Variables['fallecido']:= QuotedStr(Form1.Edit2.Text);
         Form1.frxReport1.Variables.Variables['cantidad']:= QuotedStr(Form1.Edit6.Text);
         Form1.frxReport1.Variables.Variables['letra']:= QuotedStr(Form1.Edit9.Text);
         Form1.frxReport1.Variables.Variables['presidente']:= QuotedStr(Form1.Edit11.Text);
         Form1.frxReport1.Variables.Variables['tesorero']:= QuotedStr(Form1.Edit12.Text);
         Form1.frxReport1.Variables.Variables['secretario']:= QuotedStr(Form1.Edit13.Text);
         Form1.frxReport1.Variables.Variables['recibo']:= QuotedStr(Form1.Edit10.Text);
         Form1.frxReport1.Variables.Variables['fecharecibo']:= QuotedStr(AnsiUpperCase(fecharecibo1));

         Form1.frxReport1.Variables.Variables['diaexp1']:= QuotedStr(diaexp);
         Form1.frxReport1.Variables.Variables['mesexp1']:= QuotedStr(AnsiUpperCase(mesexp));
         Form1.frxReport1.Variables.Variables['yearexp1']:= QuotedStr(yearexp);
         Form1.frxReport1.ShowReport;
          Form1.Edit2.Text:=''; Form1.Edit3.Text:='';  Form1.Edit10.Text:=''; Form1.Edit6.Text:=''; Form1.Edit9.Text:='';
       End
       else
       begin
        Form1.Edit2.Text:=''; Form1.Edit3.Text:='';  Form1.Edit10.Text:=''; Form1.Edit6.Text:=''; Form1.Edit9.Text:='';
       end;


    end;
///FIN///

end;

procedure TForm1.Consultas2Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.Edit6Exit(Sender: TObject);
var
   Number : Double;
begin
   if TryStrToFloat(Form1.Edit6.Text,Number) then
      Form1.Edit9.Text := NumbersToLetters(Number)
   else
      MessageDlg('Error en formato de Número',mtError,[mbOK],0);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Form1.DateTimePicker1.Date:=date;
Form1.DateTimePicker2.Date:=date;
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
 Application.Terminate;
end;

end.
