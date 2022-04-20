unit clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cla_cliente, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TFrmclientes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dscontato: TDataSource;
    ibcontato: TIBQuery;
    ibcontatoCOD_CLIENTE: TIntegerField;
    ibcontatoCOD_CONTATO: TIntegerField;
    ibcontatoNOME: TIBStringField;
    ibcontatoTELEFONE: TIBStringField;
    ibcontatoEMAIL: TIBStringField;
    BitBtn7: TBitBtn;
    dscliente: TDataSource;
    DBGrid2: TDBGrid;
    id_cliente: TEdit;
    nome: TEdit;
    ed_data: TMaskEdit;
    ed_tipo: TRadioGroup;
    ibcliente: TIBQuery;
    ibclienteCODIGO: TIntegerField;
    ibclienteNOME: TIBStringField;
    ibclienteNASCIMENTO: TDateField;
    ibclienteTIPOPES: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure dsclienteDataChange(Sender: TObject; Field: TField);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    loperacao:string;
  end;

var
  Frmclientes: TFrmclientes;

implementation

{$R *.dfm}
uses dmcliente, contatos;

procedure TFrmclientes.BitBtn1Click(Sender: TObject);
var id:integer;
begin
   id_cliente.Clear;
   nome.Clear;
   ed_data.Clear;
   dmcliente.DataModule1.IBCLIENTE.Close;
   dmcliente.DataModule1.ibcliente.SQL.Clear;
   dmcliente.DataModule1.ibcliente.SQL.Add('select * from clientes order by codigo');
   dmcliente.DataModule1.ibcliente.Open;
   dmcliente.DataModule1.ibcliente.Last;
   if dmcliente.DataModule1.ibcliente.RecordCount = 0 then begin
      id := 1;
   end else begin
      id := dmcliente.DataModule1.ibclientecodigo.Value + 1;
   end;
   loperacao := 'I';
   id_cliente.Text := inttostr(id);
   nome.SetFocus
end;

procedure TFrmclientes.FormShow(Sender: TObject);
begin
   dmcliente.DataModule1.ibcliente.Close;
   dmcliente.DataModule1.ibcliente.SQL.Clear;
   dmcliente.DataModule1.ibcliente.SQL.Add('select * from clientes order by codigo');
   dmcliente.DataModule1.ibcliente.Open;
   dmcliente.DataModule1.ibcontato.Close;
   dmcliente.DataModule1.ibcontato.SQL.Clear;
   dmcliente.DataModule1.ibcontato.SQL.Add('select * from contatos where cod_cliente=:0 order by cod_contato');
   dmcliente.DataModule1.ibcontato.ParamByName('0').Value := dmcliente.DataModule1.ibclienteCODIGO.Value;
   dmcliente.DataModule1.ibcontato.Open;
end;

procedure TFrmclientes.BitBtn7Click(Sender: TObject);
begin
  Frmclientes.close;
end;

procedure TFrmclientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    release;
end;

procedure TFrmclientes.BitBtn3Click(Sender: TObject);
var id:integer;
var mstring:string;
begin
  if loperacao = 'I' then begin
     id := strtoint(id_cliente.Text);
     ibcliente.Close;
     ibcliente.SQL.Clear;
     ibcliente.SQL.Add('select * from clientes where codigo=:0');
     ibcliente.ParamByName('0').Value := id;
     ibcliente.Open;
     if ibcliente.RecordCount = 0 then begin
        if dmcliente.DataModule1.IBTr.Active then
           dmcliente.DataModule1.ibtr.Commit;
        dmcliente.DataModule1.ibtr.StartTransaction;
        try
          try
            with dmcliente.DataModule1.ibsql do
            begin
              close;
              sql.Clear;
              mstring := 'Insert into clientes(codigo,nome,nascimento,tipopes)';
              mstring := mstring + 'VALUES(:0,:1,:2,:3)';
              sql.Add(mstring);
              Parambyname('0').Value:=id;
              Parambyname('1').Value:=nome.Text;
              Parambyname('2').value:=ed_data.Text;
              if ed_tipo.ItemIndex = 0 then Parambyname('3').Value:='F';
              if ed_tipo.ItemIndex = 1 then Parambyname('3').Value:='J';
              ExecQuery;
            end;
            dmcliente.DataModule1.ibtr.Commit;
            dmcliente.DataModule1.ibdatabase1.Connected   := false;
            dmcliente.DataModule1.ibdatabase1.Connected   := true;
          except
            dmcliente.DataModule1.ibtr.Rollback;
          end;
        finally
          dmcliente.DataModule1.ibsql.Close;
        end;
     end;
  end else begin
     id := strtoint(id_cliente.Text);
     if dmcliente.DataModule1.IBTr.Active then
        dmcliente.DataModule1.ibtr.Commit;
     dmcliente.DataModule1.ibtr.StartTransaction;
     try
       try
         with dmcliente.DataModule1.ibsql do
         begin
           close;
           sql.Clear;
           mstring := 'update clientes set nome=:0, nascimento=:1, tipopes=:2 where codigo=:3';
           sql.Add(mstring);
           Parambyname('0').Value:=nome.Text;
           Parambyname('1').value:=ed_data.Text;
           if ed_tipo.ItemIndex = 0 then Parambyname('2').Value:='F';
           if ed_tipo.ItemIndex = 1 then Parambyname('2').Value:='J';
           Parambyname('3').Value:=id;
           ExecQuery;
         end;
         dmcliente.DataModule1.ibtr.Commit;
         dmcliente.DataModule1.ibdatabase1.Connected   := false;
         dmcliente.DataModule1.ibdatabase1.Connected   := true;
       except
         dmcliente.DataModule1.ibtr.Rollback;
       end;
     finally
       dmcliente.DataModule1.ibsql.Close;
     end;
  end;
  Frmclientes.OnShow(self);
end;

procedure TFrmclientes.dsclienteDataChange(Sender: TObject; Field: TField);
begin
   if dmcliente.DataModule1.ibcliente.State <> dsedit then begin
     id_cliente.Text := dmcliente.DataModule1.ibclientecodigo.Text;
     nome.Text       := dmcliente.DataModule1.ibclientenome.Text;
     ed_data.Text    := datetostr(dmcliente.DataModule1.ibclientenascimento.Value);
     if dmcliente.DataModule1.ibclientetipopes.Text = 'F' then ed_tipo.ItemIndex := 0;
     if dmcliente.DataModule1.ibclientetipopes.Text = 'J' then ed_tipo.ItemIndex := 1;
     dmcliente.DataModule1.ibcontato.Close;
     dmcliente.DataModule1.ibcontato.SQL.Clear;
     dmcliente.DataModule1.ibcontato.SQL.Add('select * from contatos where cod_cliente=:0 order by cod_contato');
     dmcliente.DataModule1.ibcontato.ParamByName('0').Value := dmcliente.DataModule1.ibclienteCODIGO.Value;
     dmcliente.DataModule1.ibcontato.Open;
   end;
end;

procedure TFrmclientes.BitBtn2Click(Sender: TObject);
var id:integer;
var mstring:string;
begin
   id := strtoint(id_cliente.Text);
   dmcliente.DataModule1.ibcontato.Close;
   dmcliente.DataModule1.ibcontato.SQL.Clear;
   dmcliente.DataModule1.ibcontato.SQL.Add('select * from contatos where cod_cliente=:0 order by cod_contato');
   dmcliente.DataModule1.ibcontato.ParamByName('0').Value := id;
   dmcliente.DataModule1.ibcontato.Open;
   if dmcliente.DataModule1.ibcontato.RecordCount = 0 then begin
     IF  APPLICATION.MessageBox('DESEJA Excluir esse Cliente ?','ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES then begin
        if dmcliente.DataModule1.IBTr.Active then
           dmcliente.DataModule1.ibtr.Commit;
        dmcliente.DataModule1.ibtr.StartTransaction;
        try
          try
            with dmcliente.DataModule1.ibsql do
            begin
              close;
              sql.Clear;
              mstring := 'delete from clientes where codigo=:0';
              sql.Add(mstring);
              Parambyname('0').Value:=id;
              ExecQuery;
            end;
            dmcliente.DataModule1.ibtr.Commit;
            dmcliente.DataModule1.ibdatabase1.Connected   := false;
            dmcliente.DataModule1.ibdatabase1.Connected   := true;
          except
            dmcliente.DataModule1.ibtr.Rollback;
          end;
        finally
          dmcliente.DataModule1.ibsql.Close;
        end;
     end;
   end;
   Frmclientes.OnShow(self);
end;


procedure TFrmclientes.BitBtn4Click(Sender: TObject);
begin
   Application.CreateForm(TFrmcontatos,Frmcontatos);
   Frmcontatos.Tag := 1;
   Frmcontatos.showmodal;
   Frmclientes.OnShow(self);
end;

procedure TFrmclientes.BitBtn6Click(Sender: TObject);
begin
   Application.CreateForm(TFrmcontatos,Frmcontatos);
   Frmcontatos.Tag := 2;
   Frmcontatos.showmodal;
   Frmclientes.OnShow(self);
end;

procedure TFrmclientes.BitBtn5Click(Sender: TObject);
begin
   Application.CreateForm(TFrmcontatos,Frmcontatos);
   Frmcontatos.Tag := 3;
   Frmcontatos.showmodal;
   Frmclientes.OnShow(self);
end;

end.
