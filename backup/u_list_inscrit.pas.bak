unit u_list_inscrit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, u_liste;

type
  Tf_list_inscrit = class(TF_liste)

  procedure Init;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_list_inscrit: Tf_list_inscrit;

implementation

{$R *.lfm}

uses u_feuille_style;

procedure Tf_list_inscrit.Init;
begin
 style.panel_travail(pnl_titre);
 style.panel_travail(pnl_btn);
 style.panel_travail(pnl_affi);
 style.grille (sg_liste);
end;

end.

