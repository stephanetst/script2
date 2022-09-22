#!/bin/sh
#-----------STEPHANE TANGA------------
#Gestionnaire
#Fonction me permettant d'ajouter,rechercher, lister, supprimer et modifier des infos client (Nom, Numéro de Tel)
ajouter () {
echo "------AJOUT D'UNE NOUVELLE FICHE------"
echo "Nom ?"
read nom
echo "Tel ?"
read tel
echo "$nom,$tel" >> gestionnaire.txt
}
rechercher() {
echo "------------rechercher une fiche----------"
echo "Nom (ou une partie du nom)?"
read nom
grep "$nom" gestionnaire.txt
}
lister() {
echo "------------lister les fiches-------------"
sort gestionnaire.txt | more
}
detruire() {
echo "----------destruction d'une fiche----------"
echo "Nom (ou une partie du nom)?"
read nom
grep -v "$nom" gestionnaire.txt > buffer
mv buffer gestionnaire.txt
}
modifier() {
echo "-----------modifier une fiche--------------"
echo "Nom ? "
read nom
if grep "^$nom," gestionnaire.txt
then
echo "Nouveau telephone ?"
read tel
grep -v "^$nom" gestionnaire.txt > buffer
echo "$nom,$tel" >> buffer
mv buffer gestionnaire.txt
fi
}
pause(){
echo "appuyer sur return pour continuer"
read bouton
}
#-------------------------------------------------------
#Boucle qui permet de répéter le menu mentionner jusqu'a la fin des instructions
while :
do
echo "1- Ajouter une nouvelle fiche"
echo "2- Rechercher une fiche(entrer une partie du nom)"
echo "3- Detruire une fiche"
echo "4- Modifier une fiche"
echo "5- Lister l'annuaire"
echo "6- Fin"
echo "choix ?"
read choix
#instructions conditionnelles qui permet  d'executer les instruction au cas par cas
case "$choix" in
1) ajouter ;;
2) rechercher
 pause
 ;;
3) detruire ;;
4) modifier ;;
5) lister
 pause
 ;;
6) exit 1 ;;
*) echo "choix incorrect" ;;
esac
done
