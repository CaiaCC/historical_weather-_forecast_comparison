#! /bin/bash

# Extract Current Temperature
curr_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $curr_temp"

# Extract the forecast tempearature for noon tomorrow
fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C"

# Assign Country and City to variable TZ
TZ='Canada/Vancouver'

# Use command substitution to store the current day, month, and year in corresponding shell variables
hour=$(TZ='Canada/Vancouver' date -u +%H)
day=$(TZ='Canada/Vancouver' date -u +%d)
month=$(TZ='Canada/Vancouver' date +%m)
year=$(TZ='Canada/Vancouver' date +%Y)

# Log the weather
record=$(echo -e "$year\t$month\t$day\t$curr_temp\t$fc_temp C")
echo $record>>rx_poc.log