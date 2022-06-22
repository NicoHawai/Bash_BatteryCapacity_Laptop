### Show Battery Capacity

I made this code to keep an eye on my batterie, when we work remotely in cli, or simply if we do not have a GUI on the laptop (like for a server)  

![30%](Bat_30.PNG)  

![60%](pics/Bat_60.PNG)  

![90%](pics/Bat_90.PNG)  

Put the following function in /etc/bashrc (for every users) or ~/.bashrc (just for you)

```
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
```

Then in the same file 

```

PS1="[\$(batt_capacity)] [\u@\h]$"

```

