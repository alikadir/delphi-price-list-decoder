unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, ADODB, ComCtrls,
  ExtCtrls, GIFImage, SUIProgressBar, SUIButton;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ListBox1: TListBox;
    ListBox2: TListBox;
    DBGrid2: TDBGrid;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    DataSource2: TDataSource;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    button2: TsuiButton;
    ProgressBar1: TsuiProgressBar;
    suiButton2: TsuiButton;
    Button4: TsuiButton;
    Button1: TsuiButton;
    coz: TsuiCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cozClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
   

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}
function cevir(sayi:string):real;
var
asil_sayi:array[0..15] of integer;
deneme_sayi:array[0..15] of integer;
bulunan_sayi:array[0..15] of integer;
asil_don,deneme_don,bulunan_don:integer;
asil,deneme,bulunan,sonuc:AnsiString;
ali:real;
begin

if (sayi=null) or (sayi='0')or (Length(sayi)<>15) then
begin
//showmessage('Dikkat Hata Var !'+#13+'* �ifreli Tablo ��eri�i Algoritmayla uyums�z Olabilir !'+#13+'* Sifreli Tablonun �ifrelenmi� B�l�m� Se�ilmemi� Olabilir !'+#13+'* �ifre Algoritmas� Firma Taraf�ndan De�i�tirilmi� Olabilir !'+#13+'Program Kapat�lacak !');
//halt;
cevir:=0;
exit;
end else
begin
  asil  :='000678987654321';
  deneme:=sayi;

     for asil_don:=15 downto 1 do
       begin
       asil_sayi[asil_don]  :=strtoint(AnsiMidStr(asil,asil_don,1));
       deneme_sayi[asil_don]:=strtoint(AnsiMidStr(deneme,asil_don,1));
       end;

     for deneme_don:=15 downto 1 do
       begin
            if deneme_sayi[deneme_don] < asil_sayi[deneme_don] then
            begin
            deneme_sayi[deneme_don]:=deneme_sayi[deneme_don] + 10;
            end;

            bulunan_sayi[deneme_don]:=deneme_sayi[deneme_don]-asil_sayi[deneme_don];

       end;

     for bulunan_don:=1 to 15 do
       begin
       sonuc:=sonuc +inttostr(bulunan_sayi[bulunan_don]);
       if bulunan_don=13 then sonuc:=sonuc+',';
       end;
       ali:=strtofloat(sonuc);
       cevir:=ali;
  end;


 end;

  function cevir2(sayi:string):real;
var
asil_sayi:array[0..15] of integer;
deneme_sayi:array[0..15] of integer;
bulunan_sayi:array[0..15] of integer;
asil_don,deneme_don,bulunan_don:integer;
asil,deneme,bulunan,sonuc:AnsiString;
ali:real;
uzun:integer;
begin

if (sayi=null) or (sayi='0')or (Length(sayi)<>15) then begin
//showmessage('Dikkat Hata Var !'+#13+'* �ifreli Tablo ��eri�i Algoritmayla uyums�z Olabilir !'+#13+'* Sifreli Tablonun �ifrelenmi� B�l�m� Se�ilmemi� Olabilir !'+#13+'* �ifre Algoritmas� Firma Taraf�ndan De�i�tirilmi� Olabilir !'+#13+'Program Kapat�lacak !');
//halt;
cevir2:=0;
exit;
end else
begin
  asil  :='000678987654321';
  deneme:=sayi;

     for asil_don:=15 downto 1 do
       begin
       asil_sayi[asil_don]  :=strtoint(AnsiMidStr(asil,asil_don,1));
       deneme_sayi[asil_don]:=strtoint(AnsiMidStr(deneme,asil_don,1));
       end;

     for deneme_don:=15 downto 1 do
       begin
            if deneme_sayi[deneme_don] < asil_sayi[deneme_don] then
            begin
            deneme_sayi[deneme_don]:=deneme_sayi[deneme_don] + 10;
            end;

            bulunan_sayi[deneme_don]:=deneme_sayi[deneme_don]-asil_sayi[deneme_don];

       end;

     for bulunan_don:=1 to 15 do
       begin
       sonuc:=sonuc +inttostr(bulunan_sayi[bulunan_don]);
       if bulunan_don=13 then sonuc:=sonuc+',';
       end;
       ali:=strtofloat(sonuc);
       cevir2:=ali;
  end;


 end;
procedure TForm1.Button2Click(Sender: TObject);
var
i:integer;
nam,pah:string;
begin
if OpenDialog1.Execute then
               begin

   Table1.Active:=false;
   pah:=ExtractFilePath(OpenDialog1.FileName);
   table1.DatabaseName:=pah;
   nam:=ExtractFileName(opendialog1.FileName);
   table1.TableName:=nam;
   table1.Active:=true;
   coz.Enabled:=true;
   suibutton2.Enabled:=true;

   end;
   for i:=0 to  dbgrid1.Columns.Count-1 do
   begin
   listbox1.Items.Add(dbgrid1.Columns[i].FieldName);
  
   end;



 end;
procedure TForm1.Button3Click(Sender: TObject);
var
i:integer;
nam,pah:string;
begin
 if OpenDialog2.Execute then
               begin

   Table2.Active:=false;
   pah:=ExtractFilePath(OpenDialog2.FileName);
   table2.DatabaseName:=pah;
   nam:=ExtractFileName(opendialog2.FileName);
   table2.TableName:=nam;
   table2.Active:=true;

   for i:=0 to  dbgrid2.Columns.Count-1 do
   begin
   listbox2.Items.Add(dbgrid2.Columns[i].FieldName);
   end;

   end;
 end;
procedure TForm1.ListBox1DblClick(Sender: TObject);
var
akb:integer;
begin

 if (listbox1.itemindex>=0) and (listbox2.Itemindex>=0) then
   begin
   coz.Enabled:=false;
suibutton2.Enabled:=false;
   button4.Enabled:=true;
   if (MessageDlg('E�le�tirilen B�l�mler KDV S�Z i�lensin mi?',mtConfirmation,[mbYes,mbNo],0))=mrYes then
   begin

   listbox5.Items.Add(listbox1.Items.Strings[ListBox1.ItemIndex]);
   listbox6.Items.Add(listbox2.Items.Strings[ListBox2.ItemIndex]);
   ListBox1.DeleteSelected;
   ListBox2.DeleteSelected;
   end else
   begin
   listbox3.Items.Add(listbox1.Items.Strings[ListBox1.ItemIndex]);
   listbox4.Items.Add(listbox2.Items.Strings[ListBox2.ItemIndex]);
   ListBox1.DeleteSelected;
   ListBox2.DeleteSelected;
   end;
   end;
end;

procedure TForm1.ListBox2DblClick(Sender: TObject);


begin

 if (listbox1.itemindex>=0) and (listbox2.Itemindex>=0) then
   begin
   coz.Enabled:=false;
suibutton2.Enabled:=false;
   button4.Enabled:=true;
     if (MessageDlg('E�le�tirilen B�l�mler KDV S�Z i�lensin mi?',mtConfirmation,[mbYes,mbNo],0))=mryes then
   begin

   listbox5.Items.Add(listbox1.Items.Strings[ListBox1.ItemIndex]);
   listbox6.Items.Add(listbox2.Items.Strings[ListBox2.ItemIndex]);
   ListBox1.DeleteSelected;
   ListBox2.DeleteSelected;
   end else
   begin
   listbox3.Items.Add(listbox1.Items.Strings[ListBox1.ItemIndex]);
   listbox4.Items.Add(listbox2.Items.Strings[ListBox2.ItemIndex]);
   ListBox1.DeleteSelected;
   ListBox2.DeleteSelected;
   end;
   end;
end;
procedure TForm1.Button4Click(Sender: TObject);
 const
 renk:array[0..4]of Tcolor=(cllime,claqua,clfuchsia,clyellow,clsilver);
 var
 goster:integer;
 sayi:real;
   zaman,zmn:TDateTime;
saat,dak,san,sal,san2:Word;
sure,dk:integer;

  renksay:integer;
  label don;
   label don2;

begin
    dk:=0;
    renksay:=0;
    goster:=1;
    ProgressBar1.max:=TABLE1.RecordCount;
      zaman:=Now;
DecodeTime(zaman,saat,dak,san,sal);

    don:
     if not(ListBox3.Items.Count<1) then
      begin
         table2.First;
         table1.First;
         
         while not table1.Eof do
         begin
         table2.Edit;
         ListBox3.ItemIndex:=0;
         ListBox4.ItemIndex:=0;

         table2.FieldByName(listbox4.Items.Strings[0]).AsString:= floattostr(cevir(table1.fieldByName(listbox3.Items.Strings[0]).AsString));

         ProgressBar1.StepBy(1);

         table2.Post;
         table2.Next;
         table1.Next;
         goster:=goster+1;
         form1.Caption:=inttostr(goster);

         end;

  dbgrid1.Columns[table1.FieldByName(listbox3.Items.Strings[0]).FieldNo-1].Color:=renk[renksay];

  dbgrid2.Columns[table2.FieldByName(listbox4.Items.Strings[0]).FieldNo-1].Color:=renk[renksay];

      end;
      don2:
       goster:=goster+1;
         form1.Caption:=inttostr(goster);



      if  not(ListBox5.Items.Count<1) then
   begin
      table2.First;
      table1.First;
        while not table1.Eof do
        begin
        table2.Edit;
        ListBox5.ItemIndex:=0;
        ListBox6.ItemIndex:=0;
        sayi:=cevir2(table1.fieldByName(listbox5.Items.Strings[0]).asstring);
        sayi:=sayi/1.18;
        table2.FieldByName(listbox6.Items.Strings[0]).asstring:= floattostr(sayi);
        table2.Post;

        ProgressBar1.StepBy(1);
        table2.Next;
        table1.Next;
        goster:=goster+1;
         form1.Caption:=inttostr(goster);
        end;
dbgrid1.Columns[table1.FieldByName(listbox5.Items.Strings[0]).FieldNo-1].Color:=renk[renksay];
dbgrid2.Columns[table2.FieldByName(listbox6.Items.Strings[0]).FieldNo-1].Color:=renk[renksay];
         if listbox3.Items.Count>=1 then
         begin
         if renksay=4 then renksay:=0;
         renksay:=renksay+1;

         listbox3.DeleteSelected;
         ListBox4.DeleteSelected;

          goster:=goster+1;
         form1.Caption:=inttostr(goster);

         goto don;
          goster:=goster+1;
         form1.Caption:=inttostr(goster);

         end;
             if listbox5.Items.Count>=1 then
             begin

             if renksay>=4 then renksay:=0;
         renksay:=renksay+1;


             listbox5.DeleteSelected;
             ListBox6.DeleteSelected;
             goster:=goster+1;
             form1.Caption:=inttostr(goster);

             goto don2;
             end;

   end;
          zmn:=Now;
DecodeTime(zmn,saat,dak,san2,sal);
if san>san2 then begin san2:=san2+60; dk:=dk+1; button1.caption:=inttostr(dk)+' dk ';  end;
san:=san2-san;

  button1.caption:=button1.Caption+inttostr(san)+' Saniyede Algoritma ��zme Tamaland�.��k�� i�in t�kla ..';
         panel1.Visible:=true;
         button1.Visible:=true;
         form1.Caption:=form1.Caption+' Kay�t ��z�ld�.. ��lem bitti !';


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//panel2.Visible:=false;
button1.Visible:=false;
button4.Enabled:=false;
table2.ReadOnly:=false;

panel1.Visible:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.cozClick(Sender: TObject);
var
pah,nam,ali,veli:string;
i:integer;
 zaman:TDateTime;
saat,dak,san,sal:Word;
begin
 if coz.Checked=true then
 begin
 listbox2.items.clear;
 suibutton2.Enabled:=false;
     zaman:=Now;
DecodeTime(zaman,saat,dak,san,sal);
     pah:=table1.DatabaseName;
     nam:=table1.tablename;
     // showmessage('pah: '+pah+#13+'nam: '+nam);
     nam:=pah+nam;
     veli:='DECODING_saat='+inttostr(saat)+','+inttostr(dak)+','+inttostr(san)+'.dbf';
     ali:=pah+veli;
     //showmessage(datetostr(now)+timetostr(now));
     //showmessage('pah: '+pah+#13+'nam: '+nam+#13+'ali :'+ali);
    If CopyFile(pchar(nam),pchar(ali),True) Then
    begin


   Table2.Active:=false;
   //pah:=ExtractFilePath(OpenDialog2.FileName);
   table2.DatabaseName:=table1.DatabaseName;
   //nam:=ExtractFileName(opendialog2.FileName);
   table2.TableName:=veli;
   table2.Active:=true;

   for i:=0 to  dbgrid2.Columns.Count-1 do
   begin
   listbox2.Items.Add(dbgrid2.Columns[i].FieldName);
   end;
end Else Showmessage('Hata !!'+#13+'��z�lmesini istadi�iniz Dosyan�n Kopyas� Al�namad�');
 end else begin suiButton2.Enabled:=true; listbox2.Items.Clear; end;
 end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
sure:integer;
begin
sure:=sure+1;
form1.Caption:=form1.Caption+'Ge�en Zaman : '+inttostr(sure);
end;

end.
