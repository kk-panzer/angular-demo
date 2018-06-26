
echo "\n SUCCESS \n Deleting slave workspace..."

find /prod/build/slave1/workspace/ -maxdepth 1 -type d -mmin +120 | while read line; do echo "Cleaning directory : $line"; rm -rf ${line}/*; done;

echo "\n SUCCESS \n Deleting /tmp..."

find /tmp/ -uid 1234 -mmin +120 2> /dev/null | while read line; do echo "Cleaning file(s) : $line";rm -rf $line; done
