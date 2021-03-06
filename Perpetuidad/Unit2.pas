unit Unit2;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd, Data.DB,
  Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr;

type
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    Tperpetuidad: TSQLTable;
    Queryagregartitulo: TSQLQuery;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Querybuscarnombrefellecido: TSQLQuery;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    Tperpetuidadid_perpetuidad: TIntegerField;
    Tperpetuidadnombre_fallecido: TStringField;
    Tperpetuidadsolicitante: TStringField;
    Tperpetuidadpanteon: TStringField;
    Tperpetuidadno_recibo: TStringField;
    Tperpetuidadcantidad_pagar: TFloatField;
    Tperpetuidadfecha_recibo: TDateField;
    Tperpetuidadfecha_titulo: TDateField;
    Tperpetuidadsepulcro: TStringField;
    Tperpetuidadfila: TStringField;
    Tperpetuidadtipo: TStringField;
    Tperpetuidadpresidente: TStringField;
    Tperpetuidadsecretario: TStringField;
    Tperpetuidadtesorero: TStringField;
    Tperpetuidadseccion: TStringField;
    ClientDataSet1id_perpetuidad: TIntegerField;
    ClientDataSet1nombre_fallecido: TStringField;
    ClientDataSet1solicitante: TStringField;
    ClientDataSet1panteon: TStringField;
    ClientDataSet1no_recibo: TStringField;
    ClientDataSet1cantidad_pagar: TFloatField;
    ClientDataSet1fecha_recibo: TDateField;
    ClientDataSet1fecha_titulo: TDateField;
    ClientDataSet1sepulcro: TStringField;
    ClientDataSet1fila: TStringField;
    ClientDataSet1tipo: TStringField;
    ClientDataSet1presidente: TStringField;
    ClientDataSet1secretario: TStringField;
    ClientDataSet1tesorero: TStringField;
    ClientDataSet1seccion: TStringField;
    ClientDataSet2id_perpetuidad: TIntegerField;
    ClientDataSet2nombre_fallecido: TStringField;
    ClientDataSet2solicitante: TStringField;
    ClientDataSet2panteon: TStringField;
    ClientDataSet2no_recibo: TStringField;
    ClientDataSet2cantidad_pagar: TFloatField;
    ClientDataSet2fecha_recibo: TDateField;
    ClientDataSet2fecha_titulo: TDateField;
    ClientDataSet2sepulcro: TStringField;
    ClientDataSet2fila: TStringField;
    ClientDataSet2tipo: TStringField;
    ClientDataSet2presidente: TStringField;
    ClientDataSet2secretario: TStringField;
    ClientDataSet2tesorero: TStringField;
    ClientDataSet2seccion: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
