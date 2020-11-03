#!/bin/bash

jsname=$(curl -s https://media.interieur.gouv.fr/deplacement-covid-19/ | sed -n 's/.*deplacement-covid-19\/\(main\..*\.js\)".*/\1/p')
curl -s "https://media.interieur.gouv.fr/deplacement-covid-19/${jsname}" -o "deplacement-covid-19/${jsname}"

pdfname=$(sed -n -e 's/.*deplacement-covid-19\/\(certificate\..*\.pdf\)".*/\1/p' "deplacement-covid-19/${jsname}")
curl -s "https://media.interieur.gouv.fr/deplacement-covid-19/${pdfname}" -o "deplacement-covid-19/${pdfname}"

sed -i 's/deplacement-covid-19\/main\..*\.js/deplacement-covid-19\/'"${jsname}"'/g' generate.html
