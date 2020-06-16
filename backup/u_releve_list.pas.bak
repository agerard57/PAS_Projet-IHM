unit u_releve_list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, u_liste;

type
  Tf_releve_list = class(TF_liste)
 procedure Init;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_releve_list: Tf_releve_list;

implementation

{$R *.lfm}

uses u_feuille_style;

procedure  Tf_releve_list.Init;
begin
   style.panel_travail(pnl_titre);
   style.panel_travail(pnl_btn);
   style.panel_travail(pnl_affi);
   style.grille (sg_liste);
   sg_liste.Columns[2].Alignment:=taRightJustify;
   pnl_titre.Hide;
   pnl_btn.Hide;
end;

end.

