unit u_modele;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_loaddataset;

type
Tmodele = class(TMySQL)
   private
   { private declarations }
   public
   { public declarations }
   procedure open;
   function  inscri_list_tous : TLoadDataSet;
   function  inscri_list_filiere   (code : string) : TLoadDataSet;
   function  inscri_list_etu   (no_etu, nom_etu : string) : TLoadDataSet;
   function  inscri_num	   (num : string) : TLoadDataSet;
   function  filiere_code	   (code : string) : TLoadDataSet;
   function  inscri_notes	(num : string) : TLoadDataSet;

   function moy_inscri (num : string) : string;
   function moy_filiere (code : string) : string;

   procedure inscri_note_supr (id_ins : string);
   procedure inscri_supr	 (id_ins : string);
   procedure inscri_ajout      (id_ins, civ, nom, prenom, adresse, cp, ville, portable, tel, mel, code : string);
   procedure inscri_maj      (id_ins, civ, nom, prenom, adresse, cp, ville, portable, tel, mel : string);

   procedure close;
end;

var
     modele: Tmodele;

implementation

procedure Tmodele.open;
begin
     Bd_open ('devbdd.iutmetz.univ-lorraine.fr', 0
       	, 'gerard326u_projet_ihm'
       	, 'gerard326u_appli'
       	, '3630'
       	, 'mysqld-5', 'libmysql64.dll');
end;

procedure Tmodele.close;
begin
      Bd_close;
end;

function Tmodele.inscri_list_tous : TLoadDataSet;
begin
     result := load('sp_inscri_list_tous',[]);
end;

function Tmodele.inscri_list_filiere (code : string) : TLoadDataSet;
begin
     result := load('sp_inscri_list_filiere',[code]);
end;

function Tmodele.inscri_list_etu (no_etu, nom_etu : string) : TLoadDataSet;
begin
      result := load('sp_inscri_list_etu',[no_etu, nom_etu]);
end;

function Tmodele.inscri_num (num : string) : TLoadDataSet;
begin
     result := load('sp_inscri_num',[num]);
end;

function Tmodele.filiere_code (code : string) : TLoadDataSet;
begin
     result := load('sp_filiere_code', [code]);   //TODO
end;

function Tmodele.inscri_notes (num : string) : TLoadDataSet;
begin
     result := load('sp_etu_note',[num]);
end;

function Tmodele.moy_inscri (num : string) : string;
begin
     load('sp_moy_inscri',[num], result);
end;

function Tmodele.moy_filiere (code : string) : string;
begin
     load('sp_moy_filiere',[code], result);
end;

procedure Tmodele.inscri_note_supr (id_ins : string);
begin
     exec('sp_note_supr',[id_ins]);
end;

procedure Tmodele.inscri_supr (id_ins : string);
begin
     exec('sp_etu_supr',[id_ins]);
end;

procedure Tmodele.inscri_ajout (id_ins, civ, nom, prenom, adresse, cp, ville, portable, tel, mel, code : string);
begin
     exec('sp_etudiant_insert',[id_ins, civ, nom, prenom, adresse, cp, ville, portable, tel, mel, code]);
end;

procedure Tmodele.inscri_maj (id_ins, civ, nom, prenom, adresse, cp, ville, portable, tel, mel : string);
begin
     exec('sp_etu_maj',[id_ins], [civ, nom, prenom, adresse, cp, ville, portable, tel, mel]);
end;

begin
     modele := TModele.Create;
end.
