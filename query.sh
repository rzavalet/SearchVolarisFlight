if [ $# -ne 1 ]
then
  echo "Please provide a date in YYYY-MM-DD format"
  exit 1
fi

curl --dump-header headers_and_cookies -i --location "https://reservaciones.volaris.com/Flight/DeepLinkSearch?s=true&culture=es-MX&r=false&c=false&other-departCity=Ciudad+de+M%c3%a9xico&o1=MEX&other-returnCity=Guadalajara&d1=GDL&dni=0&promocode-select=VCA50&P=VCA50&dateDeparture=jun+3%2c+2016&dd1=${1}&dateArrival=jun+6%2c+2016&dd2=2016-06-06&cc=MXN&ADT=1&CHD=0&i=0&submit=" > 1.html

curl --cookie headers_and_cookies -i --location "https://reservaciones.volaris.com/Flight/DeepLinkSearch?s=true&culture=es-MX&r=false&c=false&other-departCity=Ciudad+de+M%c3%a9xico&o1=MEX&other-returnCity=Guadalajara&d1=GDL&dni=0&promocode-select=VCA50&P=VCA50&dateDeparture=jun+3%2c+2016&dd1=${1}&dateArrival=jun+6%2c+2016&dd2=2016-06-06&cc=MXN&ADT=1&CHD=0&i=0&submit=" > 2.html

php parse.php | grep "MEX.*GDL"
