unit dmcliente;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBSQL, IBCustomDataSet, IBQuery;

type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBSQL: TIBSQL;
    IBTr: TIBTransaction;
    ibcliente: TIBQuery;
    ibclienteCODIGO: TIntegerField;
    ibclienteNOME: TIBStringField;
    ibclienteNASCIMENTO: TDateField;
    ibclienteTIPOPES: TIBStringField;
    ibcontato: TIBQuery;
    ibcontatoCOD_CLIENTE: TIntegerField;
    ibcontatoCOD_CONTATO: TIntegerField;
    ibcontatoNOME: TIBStringField;
    ibcontatoTELEFONE: TIBStringField;
    ibcontatoEMAIL: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  ibdatabase1.Connected := true;
end;

end.
