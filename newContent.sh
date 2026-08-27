#!/bin/bash
echo "Select a type of content."
options=( $(ls -1 ./content/en/) )
PS3="Content type: "
select opt in "${options[@]}" "Abort" ; do
	if (( REPLY == 1 + ${#options[@]} )) ; then
		echo "Aborting page creation."
		exit

	elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
		PAGETYPE="$opt"
		break
	else
		echo "Not a valid type. Please try again."
	fi
done

echo "Generating new content for $PAGETYPE. Please enter a title."
read -p "New content title for $PAGETYPE: " TITLE

# Formatage du titre
TITLEF1="${TITLE,,}"	# Permet de mettre le titre en minuscule
TITLEF2=$(echo "$TITLEF1" | tr ' ' '-')	# Permet de remplacer les espaces par des traits d'union
specialChars="'?!.,"
TITLEF3=$(echo "$TITLEF2" | sed "s/[$specialChars]//g")
TITLEF4="$(date -I)-$TITLEF3.md"

echo "Generating $TITLEF4 in English and French."
hugo new content content/en/$TITLEF4
hugo new content content/fr/$TITLEF4