data division.
*-----------------------------------------------------*
*-----------------------------------------------------*	

working-storage section.
*-------constantes------------------------------------*
 01 Nom-Pgm pic X(8) value "PCALCUL".

*-------indices---------------------------------------*
 01 i-Niveau-Calc pic 9(2).

*-------variables de travail--------------------------*

*  Tableau de résultats
01 w-Tab-Res.
 05 w-Tab-Res-Ligmax occurs 10.
  10 w-resultat pic 9(3).
   88 w-resultat-ok value 1 23 188.
   88 w-resultat-ko value 0 42 666.

* Personne
01 developpeur.
 05 dev-nom pic x(10).
 05 dev-prenom pic x(20).
 05 dev-age pic 9(3).
  88 dev-age-mineur value 1 thru 17.
  88 dev-age-majeur value 18 thru 999.
 05     .
  88 dev-taille-grand pic x(8) value "grand".
  88 dev-taille-moyen pic x(8) value "moyen".
  88 dev-taille-petit pic x(8) value "petit".

local-storage section.

01 TRT.
  88 TRT-ok pic x value "O".
  88 TRT-ko pic x value "K".
*-----------------------------------------------------*
*-----------------------------------------------------*
procedure division.
*-----------------------------------------------------*
*-----------------------------------------------------*
display "Nom du programme : " Nom-Pgm

perform debut
if TRT-ok
	perform traitement
end-if
perform fin
stop run
.

debut.
set TRT-ok to true
move 1 to i-Niveau-Calc
initialize w-Tab-Res
.

traitement.

perform until i-Niveau-Calc > 5
	
	add 2 to w-resultat(i-Niveau-Calc)
	
	if dev-age-majeur
		display "nom du developpeur : " dev-nom
 	else
		display "prenom du developpeur : " dev-prenom
	end-if

end-perform

perform appel-ss-programme
.

appel-ss-programme.

	call "sous-prog" using dev-nom dev-prenom dev-age
	    
	end-call
.

fin.

move 1 to i-Niveau-Calc

perform until i-Niveau-Calc > 5
    
    display w-resultat(i-Niveau-Calc)

end-perform

.