# ex: assert_that "`gem` is installed" "gem"
# ex: assert_that "`gem` is shimmed by rbenv" "which gem" "$HOME/.rbenv/shims/gem"
# ex: assert_that "pg gem is installed" "gem list pg -i" "true"

# log the success or failure of the file...
# if only two arguments, then success is running second arg without an error
# if three, then success is the above, and when the output of running the second is equal to the third
assert_that() {
  # test for a simple error by evaling the second argument, and redirecting only
  # STDERR to a variable named ERR
  ERR=$( (eval "$2") 2>&1 >/dev/null )
  OUT=$(eval "$2")

  if [ -n "$ERR" ]; then # if ERR is not null, then...
    # echo failure to STDERR & STDOUT
    echo >&2 "${RED}$1: failure! Error: ${ERR}${RESET}" >&1
  elif [ -n "$3" ]; then # else, if there is a third argument...
    if [ "$OUT" = "$3" ]; then # and they equal
      # echo success to STDERR & STDOUT
      echo >&2 "${GREEN}$1...${RESET}" >&1
    else
      # echo failure to STDERR & STDOUT if second and third arguments do not match
      echo >&2 "${RED}$1: failure! '$OUT' does not equal '$3'.${RESET}" >&1
    fi
  else
    # echo success to STDERR & STDOUT
    echo >&2 "${GREEN}$1...${RESET}" >&1
  fi
}
