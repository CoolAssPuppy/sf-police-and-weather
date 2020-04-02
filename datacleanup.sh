awk -F, '{split($7,a,"/"); $7=a[1]"-"a[2]"-"a[3]}1' OFS=,  Weather_SFO.csv > weather.csv
awk -F, '{split($2,a,"/"); $2=a[1]"-"a[2]"-"a[3]}1' OFS=,  Police_Department_Incident_Reports__2018_to_Present.csv > police.csv
