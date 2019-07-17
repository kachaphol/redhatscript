#############tput_script.sh############################
#!/bin/bash
quit=n
while [ "$quit" = 'n' ]
do
#############clean the screen
tput clear

#############Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 15

#############set a foreground color using ANSI escape
tput cup 4 55
echo "Aware Corp LTD."
tput sgr0
tput cup 5 54

#############set video mode
tput rev
echo "M A I N - M E N U"
tput sgr0
tput cup 7 50

echo "1. Check Service HTTPD"
tput cup 8 50

echo "2. Stop  Service HTTPD"
tput cup 9 50

echo "3. Start Service HTTPD"
tput cup 10 50

echo "Press q to Quit"

#############Set bold mode
tput bold
tput cup 12 50
echo "Enter Your Choice [1-4]"
tput cup 12 80
read Choice
tput clear

#############esac case
case $Choice in
1) status;;
2) stop;;
3) start;;
Q|q) quit=y;;
*)tput rev
  tput cup 5 55
  echo "   try Again !!!   "
  sleep 1
esac

#############declare & Recursion Function
status(){
	 SERVICE='httpd'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
	tput cup 5 50
	echo "$SERVICE service running, Everything OK ^^ "
	sleep 3
else
	tput cup 5 50
	echo "$SERVICE service is not running 0_0!"
	sleep 3
fi 
}

############ Stop Service
stop(){
	service httpd stop
	tput cup 5 50
	sleep 3
}

############ Start Service
start(){
	service httpd start
	tput cup 5 50
	Sleep 3
}
done
tput bold
tput cup 5 55
echo "Thank you, See you again ^^"
sleep 3
tput clear
######end code 
