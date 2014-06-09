Subject="Log Report"
Receipients="philco@ga.co"
Message_Success="Done"
Path_Log_file="$HOME/.wdi/install.log"

{ echo -e "$Message_Success\n\n" ; cat $Path_Log_file ; } | mail -s "$Subject" "$Recipients"

# FIXME (phlco) this reports broken pipe in ubuntu
# run exec $SHELL at end?
# atom . doesn't work.
# subl . works
