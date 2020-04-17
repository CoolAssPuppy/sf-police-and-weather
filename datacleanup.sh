awk -F, '{split($7,a,"/"); $7=a[1]"-"a[2]"-"a[3]}1' OFS=,  Weather_SFO.csv > weather.csv
awk -F, '{split($2,a,"/"); $2=a[1]"-"a[2]"-"a[3]}1' OFS=,  Police_Department_Incident_Reports__2018_to_Present.csv > police.csv
gawk -v FPAT='([^,]*)|("[^"]*")' '{for(i = 1; i < 18; i++) { if(i != 11 && i != 17) printf("%s,", $i); else if (i != 11) printf("%s\n", $i); } }' OFS=, 311_Cases.csv