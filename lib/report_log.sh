
# email subject
SUBJECT="Log Report"
# Email To ?
EMAIL="andrew@ga.co"
# Email text/message
EMAILMESSAGE="/tmp/emailmessage.txt"
cat "$HOME/.wdi/install.log"> $EMAILMESSAGE
# send an email using /bin/mail
mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE

# FIXME (phlco) this reports broken pipe in ubuntu
# run exec $SHELL at end?
# atom . doesn't work.
# subl . works
