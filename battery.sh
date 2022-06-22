#!/bin/bash
batt_capacity()
{
        declare -i life_live=$(cat /sys/class/power_supply/BAT0/capacity)
        declare -i finish=0
        if [ $life_live -le 40 ]
        then
                echo -e -n "\e[0;30;41m" # Background: RED / Text: black
        else
                echo -e -n "\e[0;30;42m" # Background: GREEN / Text: black
        fi

        for i in {1..10}; do

                if [ $((i*10)) -gt $life_live ]
                then
                        finish=1
                        echo -e -n "\e[0m" # End of colors
                fi
                echo -n -e "|"
        done
        if [ !finish ]
        then
                echo -e "\e[0m" # End of color
        fi
}
