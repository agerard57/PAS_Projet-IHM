unit u_detail_inscrit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tf_detail_inscrit }

  Tf_detail_inscrit = class(TForm)
    btn_annuler: TButton;
    btn_valider: TButton;
    btn_retour: TButton;
    cbb_genre: TComboBox;
    cbb_filiere: TComboBox;
    edt_genre: TEdit;
    edt_tel: TEdit;
    edt_port: TEdit;
    edt_mel: TEdit;
    edt_filiere: TEdit;
    edt_adresse: TEdit;
    edt_postal: TEdit;
    edt_ville: TEdit;
    edt_num: TEdit;
    edt_nom: TEdit;
    edt_prenom: TEdit;
    lbl_num_erreur: TLabel;
    lbl_filiere_erreur: TLabel;
    lbl_nom_erreur: TLabel;
    lbl_prenom_erreur: TLabel;
    lbl_adresse_erreur: TLabel;
    lbl_postal_erreur: TLabel;
    lbl_ville_erreur: TLabel;
    lbl_tel_erreur: TLabel;
    lbl_mel_erreur: TLabel;
    lbl_ident: TLabel;
    lbl_filiere: TLabel;
    lbl_fili_court: TLabel;
    lbl_fili_long: TLabel;
    lbl_releve: TLabel;
    lbl_releve_erreur: TLabel;
    lbl_num: TLabel;
    lbl_nom: TLabel;
    lbl_prenom: TLabel;
    lbl_adresse: TLabel;
    lbl_contact: TLabel;
    lbl_tel: TLabel;
    lbl_port: TLabel;
    lbl_mel: TLabel;
    pnl_releve_titre: TPanel;
    pnl_releve_list: TPanel;
    pnl_btn: TPanel;
    pnl_releve: TPanel;
    pnl_titre: TPanel;
    pnl_detail: TPanel;
    pnl_ident: TPanel;
    pnl_adresse: TPanel;
    pnl_contact: TPanel;
    pnl_filiere: TPanel;
    procedure btn_annulerClick(Sender: TObject);
    procedure btn_retourClick(Sender: TObject);
    procedure edt_genreKeyPress(Sender: TObject; var Key: char);
    procedure edt_numExit(Sender: TObject);
    procedure edt_nomExit(Sender: TObject);
    procedure edt_prenomExit(Sender: TObject);
    procedure edt_adresseExit(Sender: TObject);
    procedure edt_postalExit(Sender: TObject);
    procedure edt_villeExit(Sender: TObject);
    procedure edt_telExit(Sender: TObject);
    procedure edt_portExit(Sender: TObject);
    procedure edt_melExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure init ( idinf : string; affi : boolean);
    procedure detail ( idinf : string);
    procedure edit ( idinf : string);
    procedure add;
    procedure delete ( idinf : string);
    procedure lbl_fili_courtClick(Sender: TObject);
    procedure lbl_fili_longClick(Sender: TObject);
    procedure pnl_titreClick(Sender: TObject);
    procedure edt_Enter (Sender : TObject );
    procedure btn_validerClick(Sender: TObject);

  private
    { private declarations }
     procedure affi_page;
     procedure affi_ident ( num : string);
     procedure affi_adresse ( num : string);
     procedure affi_contact ( num : string);
     procedure affi_filiere ( num : string);
     function  affi_erreur_saisie (erreur : string; lbl : TLabel; obj : TObject) : boolean;

  public
    { public declarations }
  end;

var
  f_detail_inscrit: Tf_detail_inscrit;

implementation

{$R *.lfm}

uses u_feuille_style, u_list_inscrit, u_select_inscrit;

{ Tf_detail_inscrit }

Var oldvaleur : string;
 id : string;
procedure Tf_detail_inscrit.Init ( idinf : string; affi : boolean);


begin
 style.panel_travail (pnl_titre);
 style.panel_travail (pnl_btn);
 style.panel_travail (pnl_detail);
 style.panel_travail (pnl_ident);
 style.panel_travail (pnl_adresse);
 style.panel_travail (pnl_contact);
 style.panel_travail (pnl_filiere);
 style.panel_travail (pnl_releve);
 style.panel_travail (pnl_releve_titre);

 style.label_titre (lbl_ident);
 style.label_titre (lbl_adresse);
 style.label_titre (lbl_contact);
 style.label_titre (lbl_filiere);
 style.label_titre (lbl_releve);

 style.label_erreur (lbl_num_erreur);
 style.label_erreur (lbl_nom_erreur);
 style.label_erreur (lbl_prenom_erreur);
 style.label_erreur (lbl_adresse_erreur);
 style.label_erreur (lbl_postal_erreur);
 style.label_erreur (lbl_ville_erreur);
 style.label_erreur (lbl_tel_erreur);
 style.label_erreur (lbl_mel_erreur);
 style.label_erreur (lbl_filiere_erreur);
 style.label_erreur (lbl_releve_erreur);

// initialisation identification
 lbl_num_erreur.caption :='';
 lbl_nom_erreur.caption :='';
 lbl_prenom_erreur.caption :='';
 edt_num.clear;
 edt_nom.clear;
 edt_prenom.clear;
 edt_genre.clear;
 cbb_filiere.ReadOnly := true;
 cbb_genre.ReadOnly := true;
// initialisation adresse
 lbl_adresse_erreur.caption :='';
 lbl_postal_erreur.caption :='';
 lbl_ville_erreur.caption :='';
 edt_adresse.clear;
 edt_adresse.ReadOnly :=affi;
 edt_postal.clear;
 edt_postal.ReadOnly :=affi;
 edt_ville.clear;
 edt_ville.ReadOnly :=affi;
// initialisation contact
 lbl_tel_erreur.caption :='';
 lbl_mel_erreur.caption :='';
 edt_tel.clear;
 edt_tel.ReadOnly :=affi;
 edt_port.clear;
 edt_port.ReadOnly :=affi;
 edt_mel.clear;
 edt_mel.ReadOnly :=affi;

// initialisation filiere
 lbl_filiere_erreur.caption :='';
 lbl_fili_long.caption :='';
 lbl_fili_court.caption :='';
 edt_filiere.clear;
 edt_filiere.ReadOnly :=affi;


// init autre
 btn_retour.visible  :=affi;
 btn_valider.visible :=NOT affi;
 btn_annuler.visible :=NOT affi;

// initialisation releve
 lbl_releve_erreur.Caption :='';
 show;
 id := idinf;
 IF NOT ( id = '')
 THEN affi_page;
end;

procedure Tf_detail_inscrit.btn_validerClick(Sender: TObject);
var
    //flux : TLoadDataSet;
    saisie, erreur, ch	 : string;
    i 	     : integer;
    complete  : boolean;
begin
    complete := true;

        if  id = ''
    then begin
	 erreur := '';
	 saisie := edt_num.text;
	 if  saisie = ''   then  erreur := 'Le numéro doit être rempli.'
	 //else begin
	   //   flux := modele.inscrit_liste_etu(saisie, '');
	     // if  NOT  flux.endOf
	       //then  erreur := 'Le numéro existe déjà';
	 end;
	 complete := affi_erreur_saisie (erreur, lbl_num_erreur, edt_num)  AND  complete;

    erreur := '';
    saisie := edt_nom.text;
    if  saisie = ''  then  erreur := 'Le nom doit être rempli.';
    complete := affi_erreur_saisie (erreur, lbl_nom_erreur, edt_nom)  AND  complete;

    erreur := '';
    saisie := edt_prenom.text;
    if  saisie = ''  then  erreur := 'Le prénom doit être rempli.';
    complete := affi_erreur_saisie (erreur, lbl_prenom_erreur, edt_prenom)  AND  complete;

    erreur := '';
    saisie := edt_adresse.text;
    if  saisie = ''  then  erreur := 'L''adresse doit être remplie.';
    complete := affi_erreur_saisie (erreur, lbl_adresse_erreur, edt_adresse)  AND  complete;

    erreur := '';
    saisie := edt_postal.text;
    if  saisie = ''  then  erreur := 'Le code postal doit être rempli.';
    complete := affi_erreur_saisie (erreur, lbl_postal_erreur, edt_postal)  AND  complete;

    erreur := '';
    saisie := edt_ville.text;
    if  saisie = ''  then  erreur := 'La commune doit être remplie.';
    complete := affi_erreur_saisie (erreur, lbl_ville_erreur, edt_ville)  AND  complete;

    erreur := '';
    saisie := edt_tel.text + edt_port.text;
    if  saisie = ''  then  erreur := 'Le téléphone ou le portable doit être rempli.';
    complete := affi_erreur_saisie (erreur, lbl_tel_erreur, edt_tel)  AND  complete;

    erreur := '';
    saisie := edt_mel.text;
    if  saisie = ''  then  erreur := 'L''adresse mel doit être remplie.';
    complete := affi_erreur_saisie (erreur, lbl_mel_erreur, edt_mel)  AND  complete;


    erreur := '';
    saisie := cbb_filiere.text;
    if  saisie = ''  then  erreur := 'La filière doit être renseignée.';
complete := affi_erreur_saisie (erreur, lbl_filiere_erreur, cbb_filiere)  AND  complete;

end;


procedure Tf_detail_inscrit.affi_page;
begin
// affichage des données de la base, complété par la suite
end;

procedure Tf_detail_inscrit.btn_annulerClick(Sender: TObject);
begin
f_select_inscrit.show;
close;
end;

procedure Tf_detail_inscrit.btn_retourClick(Sender: TObject);
begin
f_select_inscrit.show;
close;
end;

procedure Tf_detail_inscrit.edt_genreKeyPress(Sender: TObject; var Key: char);
begin

end;


procedure Tf_detail_inscrit.edt_numExit(Sender: TObject);
begin
edt_num.text := TRIM(edt_num.text);
end;

procedure Tf_detail_inscrit.edt_nomExit(Sender: TObject);
begin
edt_nom.text := TRIM(edt_nom.text);
end;

procedure Tf_detail_inscrit.edt_prenomExit(Sender: TObject);
begin
edt_prenom.text := TRIM(edt_prenom.text);
end;

procedure Tf_detail_inscrit.edt_adresseExit(Sender: TObject);
begin
edt_adresse.text := TRIM(edt_adresse.text);
IF NOT ( edt_adresse.text = oldvaleur )
THEN affi_adresse (edt_adresse.text);

end;

procedure Tf_detail_inscrit.edt_villeExit(Sender: TObject);
begin
edt_ville.text := TRIM(edt_ville.text);
IF NOT ( edt_ville.text = oldvaleur )
THEN affi_adresse (edt_ville.text);

end;

procedure Tf_detail_inscrit.edt_postalExit(Sender: TObject);
begin
edt_postal.text := TRIM(edt_postal.text);
IF NOT ( edt_postal.text = oldvaleur )
THEN affi_adresse (edt_postal.text);

end;

procedure Tf_detail_inscrit.edt_telExit(Sender: TObject);
begin
edt_tel.text := TRIM(edt_tel.text);
IF NOT ( edt_tel.text = oldvaleur )
THEN affi_contact (edt_tel.text);

end;

procedure Tf_detail_inscrit.edt_portExit(Sender: TObject);
begin
edt_port.text := TRIM(edt_port.text);
IF NOT ( edt_port.text = oldvaleur )
THEN affi_contact (edt_port.text);

end;

procedure Tf_detail_inscrit.edt_melExit(Sender: TObject);
begin
edt_mel.text := TRIM(edt_mel.text);
IF NOT ( edt_mel.text = oldvaleur )
THEN affi_contact (edt_mel.text);

end;

procedure Tf_detail_inscrit.FormShow(Sender: TObject);
begin
  f_select_inscrit.hide;
end;

procedure Tf_detail_inscrit.detail (idinf : string);
begin
 init (idinf, true); // mode affichage
 pnl_titre.caption := 'Détail d''une inscription';
 btn_retour.setFocus;
 edt_genre.Visible := True;
 edt_filiere.visible := True;
 cbb_genre.Visible := False;
 cbb_filiere.visible := False;
end;

procedure Tf_detail_inscrit.edit (idinf : string);
begin
 init (idinf, false);
 pnl_titre.caption := 'Modification d''une inscription';
 edt_num.ReadOnly := true;
 edt_genre.Visible := False;
 edt_filiere.visible := False;
 cbb_genre.Visible := True;
 cbb_filiere.visible := True;
end;

procedure Tf_detail_inscrit.add;
begin
 init ('',false);
 pnl_titre.caption := 'Nouvelle inscription';
 edt_num.setFocus;
 edt_genre.Visible := False;
 edt_filiere.visible := False;
 cbb_genre.Visible := True;
 cbb_filiere.visible := True;
end;
procedure Tf_detail_inscrit.delete (idinf : string);
begin
 IF messagedlg ('Demande de confirmation'
 ,'Confirmez-vous la suppression de l''inscrit n°' +idinf
 ,mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes
 THEN BEGIN
// suppression dans la base, complété par la suite
f_list_inscrit.line_delete;
 END;
end;

procedure Tf_detail_inscrit.lbl_fili_courtClick(Sender: TObject);
begin

end;

procedure Tf_detail_inscrit.lbl_fili_longClick(Sender: TObject);
begin

end;

procedure Tf_detail_inscrit.pnl_titreClick(Sender: TObject);
begin

end;

procedure Tf_detail_inscrit.edt_Enter(Sender :
TObject);
begin
oldvaleur := TEdit(Sender).text; oldvaleur := TEdit(Sender).text;
end;

 procedure Tf_detail_inscrit.affi_ident (num : string);
var
   ch : string;
begin
   if  num = ''
   then  lbl_num_erreur.caption := 'erreur1'
   else  begin
           // appel procédure chargement des données, à compléter par la suite
   end;
end;

 procedure Tf_detail_inscrit.affi_adresse (num : string);
 var
    ch : string;
 begin
    if  num = ''
    then  lbl_adresse_erreur.caption := 'erreur2'
    else  begin
          // appel procédure chargement des données, à compléter par la suite
    end;
 end;

 procedure Tf_detail_inscrit.affi_contact (num : string);
var
   ch : string;
begin

   if  num = ''
   then lbl_tel_erreur.caption := 'erreur3'
   else  begin
           // appel procédure chargement des données, à compléter par la suite
   end;
end;

 procedure Tf_detail_inscrit.affi_filiere (num : string);
var
   ch : string;
begin

   if  num = ''
   then lbl_filiere_erreur.caption := 'erreur4'
   else  begin
           // appel procédure chargement des données, à compléter par la suite
   end;
end;

 function  Tf_detail_inscrit.affi_erreur_saisie (erreur : string; lbl : TLabel; obj : TObject) : boolean;
begin
   lbl.caption := erreur;
   if  NOT (erreur = '')
   then begin
	TEdit(obj).setFocus;
	result := false;
   end
   else result := true;
end;

end.

