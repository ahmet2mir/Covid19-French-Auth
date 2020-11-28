#!/bin/bash

curl -s 'https://media.interieur.gouv.fr/deplacement-covid-19/index.html' -o "deplacement-covid-19/gouv.html"

html-beautify -r deplacement-covid-19/gouv.html

jsname=$(sed -n 's/.*deplacement-covid-19\/\(main\..*\.js\)".*/\1/p' "deplacement-covid-19/gouv.html")
curl -s "https://media.interieur.gouv.fr/deplacement-covid-19/${jsname}" -o "deplacement-covid-19/${jsname}"

pdfname=$(sed -n -e 's/.*deplacement-covid-19\/\(certificate\..*\.pdf\)".*/\1/p' "deplacement-covid-19/${jsname}")
curl -s "https://media.interieur.gouv.fr/deplacement-covid-19/${pdfname}" -o "deplacement-covid-19/${pdfname}"

sed -i 's/deplacement-covid-19\/main\..*\.js/deplacement-covid-19\/'"${jsname}"'/g' generate.html

echo "Fields Gouv"
sed -n -e 's/.*class="form-control" id="\(.*\)" name=.*/\1/p' "deplacement-covid-19/gouv.html" | sort
sed -n -e 's/.*name="field-reason" value="\(.*\)"><label.*/\1/p' "deplacement-covid-19/gouv.html" | sort

echo

echo "Fields Self"
sed -n -e 's/.*input type=.* id="\(.*\)" name=.*/\1/p' "generate.html" | sort
sed -n -e 's/.*type="radio" name="field-reason" id="radio-\(.*\)" value.*/\1/p' "generate.html" | sort
echo
