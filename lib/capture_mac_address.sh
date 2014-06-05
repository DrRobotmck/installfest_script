
echo "Script now will gather your mac address and send to the class chatbot for"
echo "attendance porpoises. This is an opt out situation."
echo "     ,_________________"
echo "    /                  \\"
echo "    | 54:26:96:d6:71:c7 |          ,__"
echo "    |  ________________/        _./  .)"
echo "    | /   _.--~~~~~---....__  .' . .,'"
echo "    |/  ,'. . . . . . . . . .~- ._ ("
echo "       ( .. .g. . . . . . . . . . .~-._"
echo "    .~__.-~    ~ . . . . . . . . . . . -."
echo "    '----..._      ~-=~~-. . . . . . . . ~-."
echo "              ~-._   '-._ ~=_~~--. . . . . .~."
echo "               | .~-.._  ~--._-.    ~-. . . . ~-."
echo "                \ .(   ~~--.._~'       '. . . . .~-.                ,"
echo "                 '._\         ~~--.._    '. . . . . ~-.    .- .   ,'/"
echo " _  . _ . -~\        _ ..  _          ~~--.'_. . . . . ~-_     ,-',''  ."
echo "              ' ._           ~                ~--. . . . .~=.-'. /. '"
echo "        - . -~            -. _ . - ~ - _   - ~     ~--..__~ _,. /   \  - ~"
echo "               . __ ..                   ~-               ~~_. (  '"
echo " )'. _ _               '-       ..  - .    . - ~ ~ .    \    ~-' ' '  '. _"
echo "                                                     - .  '  .   \  \ '."
echo
read -p "May we capture and send your mac address?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # Get MAC address for attendance
  # 	ether 54:26:96:d6:71:c7
  mac_address=$(sudo ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')

  # TODO (philco)

  # # curl mac address info to chatbot
  # chatbot="http://localhost:8080"
  # url="$chatbot/students"
  #
  # curl -H "Content-Type: application/json" -d '{
  #   "name"         : "'$user_name'",
  #   "email"        : "'$github_email'",
  #   "github"       : "'$github_name'",
  #   "mac_address"  : "'$mac_address'"
  # }' "$url"
fi
