unit contatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmcontatos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    id_cliente: TEdit;
    nome_cliente: TEdit;
    id_contato: TEdit;
    ed_nome: TEdit;
    ed_fone: TEdit;
    ed_email: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmcontatos: TFrmcontatos;

implementation

{$R *.dfm}
uses dmcliente, clientes;

procedure TFrmcontatos.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmcontatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  release;
end;

procedure TFrmcontatos.FormShow(Sender: TObject);
var idcon:integer;
begin
   id_cliente.Text   := dmcliente.DataModule1.ibclientecodigo.Text;
   nome_cliente.Text := dmcliente.DataModule1.ibclientenome.Text;
   if Frmcontatos.Tag = 1 then begin
      dmcliente.DataModule1.ibcontato.SQL.Clear;
      dmcliente.DataModule1.ibcontato.SQL.Add('select * from contatos where cod_cliente=:0 order by cod_contato');
      dmcliente.DataModule1.ibcontato.ParamByName('0').Value := dmcliente.DataModule1.ibclienteCODIGO.Value;
      dmcliente.DataModule1.ibcontato.Open;
      dmcliente.DataModule1.ibcontato.Last;
      if dmcliente.DataModule1.ibcontato.RecordCount = 0 then begin
         idcon := 1;
      end else begin
         idcon := dmcliente.DataModule1.ibcontatocod_contato.Value + 1;
      end;
      id_contato.Text := inttostr(idcon);
      ed_nome.SetFocus;
   end else begin
      id_contato.Text := dmcliente.DataModule1.ibcontatoCOD_CONTATO.Text;
      ed_nome.Text    := dmcliente.DataModule1.ibcontatonome.Text;
      ed_fone.Text    := dmcliente.DataModule1.ibcontatoTELEFONE.Text;
      ed_email.Text   := dmcliente.DataModule1.ibcontatoEMAIL.Text;
      if Frmcontatos.tag = 2 then ed_nome.SetFocus;
   end;
end;

procedure TFrmcontatos.BitBtn1Click(Sender: TObject);
var id:integer;
var mstring:string;
begin
  id := strtoint(id_contato.Text);
  if Frmcontatos.Tag = 1 then begin
     dmcliente.DataModule1.ibcontato.SQL.Clear;
     dmcliente.DataModule1.ibcontato.SQL.Add('select * from contatos where cod_cliente=:0 and cod_contato=:1');
     dmcliente.DataModule1.ibcontato.ParamByName('0').Value := dmcliente.DataModule1.ibclienteCODIGO.Value;
     dmcliente.DataModule1.ibcontato.ParamByName('1').Value := id;
     dmcliente.DataModule1.ibcontato.Open;
     if dmcliente.DataModule1.ibcontato.RecordCount = 0 then begin
        if dmcliente.DataModule1.IBTr.Active then
           dmcliente.DataModule1.ibtr.Commit;
        dmcliente.DataModule1.ibtr.StartTransaction;
        try
          try
            with dmcliente.DataModule1.ibsql do
            begin
              close;
              sql.Clear;
              mstring := 'Insert into contatos(cod_cliente,cod_contato,nome,telefone,email)';
              mstring := mstring + 'VALUES(:0,:1,:2,:3,:4)';
              sql.Add(mstring);
              Parambyname('0').value:=dmcliente.DataModule1.ibclienteCODIGO.Value;
              Parambyname('1').Value:=id;
              Parambyname('2').Value:=ed_nome.Text;
              Parambyname('3').value:=ed_fone.Text;
              Parambyname('4').value:=ed_email.Text;
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
  IF Frmcontatos.tag = 2 then begin
     if dmcliente.DataModule1.IBTr.Active then
        dmcliente.DataModule1.ibtr.Commit;
     dmcliente.DataModule1.ibtr.StartTransaction;
     try
       try
         with dmcliente.DataModule1.ibsql do
         begin
           close;
           sql.Clear;
           mstring := 'update contatos set nome=:0, telefone=:1, email=:2 where cod_cliente=:3 and cod_contato=:4';
           sql.Add(mstring);
           Parambyname('0').Value:=ed_nome.Text;
           Parambyname('1').value:=ed_fone.Text;
           Parambyname('2').value:=ed_email.Text;
           Parambyname('3').value:=dmcliente.DataModule1.ibclienteCODIGO.Value;
           Parambyname('4').Value:=id;
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
  if Frmcontatos.Tag=3 then begin
     IF  APPLICATION.MessageBox('DESEJA Excluir esse Contato ?','ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES then begin
        if dmcliente.DataModule1.IBTr.Active then
           dmcliente.DataModule1.ibtr.Commit;
        dmcliente.DataModule1.ibtr.StartTransaction;
        try
          try
            with dmcliente.DataModule1.ibsql do
            begin
              close;
              sql.Clear;
              mstring := 'delete from contatos where cod_cliente=:0 and cod_contato=:1';
              sql.Add(mstring);
              Parambyname('0').value:=dmcliente.DataModule1.ibclienteCODIGO.Value;
              Parambyname('1').Value:=id;
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
  frmcontatos.Close;
end;

end.
