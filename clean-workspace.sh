
echo "Deleting workpace of slave1"

${AT_PATH}/ssh_util.sh ssh jmjnkns ${circle_of_life} ccloud-linux03670 'find /prod/build/jobs -name "workspace" -print -mmin +120 | while read line; do echo "Cleaning directory : $line"; done;'

echo "\n SUCCESS \n Deleting slave workspace..."

find /prod/msp/build/slave1/workspace/ -maxdepth 1 -type d -mmin +120 | while read line; do echo "Cleaning directory : $line"; rm -rf ${line}/*; done;

echo "\n SUCCESS \n Deleting /tmp..."

find /tmp/ -uid 56274 -mmin +120 2> /dev/null | while read line; do echo "Cleaning file(s) : $line";rm -rf $line; done
