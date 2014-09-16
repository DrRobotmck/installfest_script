
# email subject
SUBJECT="Installfest Log Report for $github_name $github_email"
# Email To ?
EMAIL="wdi-bot@generalassemb.ly"
# Email text/message
EMAILMESSAGE="/tmp/emailmessage.txt"
cat "$HOME/.wdi/install.log"> $EMAILMESSAGE

# send an email using /bin/mail
mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE

# FIXME (phlco) this reports broken pipe in ubuntu
# run exec $SHELL at end?
# atom . doesn't work.
# subl . works
