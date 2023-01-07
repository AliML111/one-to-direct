#!/bin/bash
echo "Enter your Embedded links: " && cat > t.txt
grep -Po "https://[^']+" t.txt | cut -d"\"" -f1 | sed "s/embed/download/" >> t.txt 
sed -i '/</d' t.txt
echo "Subject:Your download links comin n hot!" | msmtp gameali774@hotmail.com < t.txt
