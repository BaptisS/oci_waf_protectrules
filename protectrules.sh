#!/bin/bash
rm -f protectrule.sh
wget https://raw.githubusercontent.com/BaptisS/oci_waf_protectrules/master/protectrule.sh
chmod +x protectrule.sh

protectruleids=$(cat protectrulesids.txt)
#wafcidrs=$(echo $wafips | jq '.data[] | .cidr')

rm -f waf-protectrules.json
rm -f waf-protectrules-temp.json


echo "[" >> waf-protectrules-temp.json
for key in $protectruleids; do ./protectrule.sh $key ; done
cat waf-protectrules.json >> waf-protectrules-temp.json
echo "]" >> waf-protectrules-temp.json                                           
sed -zr 's/,([^,]*$)/\1/' waf-protectrules-temp.json > waf-protectrules.json
rm -f waf-protectrules-temp.json
#oci network security-list update --security-list-id $wafseclist --ingress-security-rules file://seclist-waf-TCP80443.json --force

#rm -f wafrule-TCP80.sh
#rm -f wafrule-TCP443.sh

#rm -f seclist-waf-TCP80443-temp.json
#rm -f seclist-waf-TCP80443.json
#rm -f seclist-waf-TCP443.json
