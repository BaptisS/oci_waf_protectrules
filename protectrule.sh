#!/bin/bash
echo "  {" >> waf-protectrules.json
echo "        \"action\": \"BLOCK\",">> waf-protectrules.json
echo "        \"key\": \"$1\"">> waf-protectrules.json
echo "   },">> waf-protectrules.json
