# Subject="Log"
# Receipients="philco@ga.co"
# Message_Success="Done"
# { echo -e "$Message_Success\n\n" ; cat $Path_Log_file ; } | mail -s "$Subject" "$Recipients"

mkdir -p ~/.wdi # must make this here in order to store the log file
exec > >(tee ~/.wdi/install.log)

# http://stackoverflow.com/questions/3173131/redirect-copy-of-stdout-to-log-file-from-within-bash-script-itself
# Without this, only stdout would be captured - i.e. your
# log file would not contain any error messages.
# SEE answer by Adam Spiers, which keeps STDERR a seperate stream -
# I did not want to steal from him by simply adding his answer to mine.
exec 2>&1

echo "Script executed at $(date)"
echo ""
