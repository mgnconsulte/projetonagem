unit projeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cla_cliente, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, Buttons, Mask, ExtCtrls;

type
  TFrmclientes = class(TForm)
    Label1: TLabel;
    id_cliente: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ed_nome: TEdit;
    ed_tipo: TRadioGroup;
    ed_data: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dscontato: TDataSource;
    ibcliente: TIBQuery;
    ibcontato: TIBQuery;
    ibclienteCODIGO: TIntegerField;
    ibclienteNOME: TIBStringField;
    ibclienteNASCIMENTO: TDateField;
    ibclienteTIPOPES: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmclientes: TFrmclientes;

implementation

{$R *.dfm}
uses dmcliente;

procedure TFrmclientes.BitBtn1Click(Sender: TObject);
begin
   ibcliente.Close;
end;

procedure TFrmclientes.FormShow(Sender: TObject);
begin
   ibcliente.Close;
   ibcliente.SQL.Clear;
   ibcliente.SQL.Add('select * from clientes order by codigo');
   ibcliente.Open;
   ibcontato.Close;
   ibcontato.SQL.Clear;
   ibcontato.SQL.Add('select * from contatos where cod_cliente=:0 order by cod_contato');
   ibcontato.Open;

end;

end.
