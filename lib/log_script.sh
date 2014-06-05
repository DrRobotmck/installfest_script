
#-------------------------------------------------------------------------------
# Logging
#-------------------------------------------------------------------------------

# Subject="Log"
# Receipients="philco@ga.co"
# Message_Success="Done"
# { echo -e "$Message_Success\n\n" ; cat $Path_Log_file ; } | mail -s "$Subject" "$Recipients"

mkdir -p ~/.wdi; exec > >(tee ~/.wdi/install.log); exec 2>&1

echo "Script executed at $(date)"
echo ""
