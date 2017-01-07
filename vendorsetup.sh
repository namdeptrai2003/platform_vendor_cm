for combo in $(curl -s https://raw.githubusercontent.com/UOS-By-Uteam/hudson/uos-0.2/uos-target-devices | sed -e 's/#.*$//' | grep uos-0.2 | awk '{printf "uos_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
