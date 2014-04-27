AllowedError=5


SomeErrorHandler () {
    (( errcount++ ))       # or (( errcount += $? ))
    if  (( errcount > $AllowedError )); then
        echo "Too many errors"
        exit $errcount
    fi
}

SayGoodBye() {
  echo "so long"
}

trap SayGoodBye EXIT ERR


trap SomeErrorHandler ERR

for i in {1..6}; do
    false
    echo "Reached $i"     # "Reached 6" is never printed
done

echo "completed"          # this is never printed

