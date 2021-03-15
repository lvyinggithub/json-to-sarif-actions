#!/bin/bash
#name=$1
#yum install -y  jq
#sudo apt-get -y install jq
json_file_path=$1
licens_sarif_path=$2

head=""


#json_file_path=$(cat license-go.json | sed 's/[[:space:]]//g' | sed 's/"/\\"/g' ) 

json_str=$(cat ${json_file_path} | sed 's/[[:space:]]//g' | sed 's/"/\\"/g' ) 
#echo -e $json_str

content=""
tiele=""



while read line || [[ -n ${line} ]];
do

  # line=$line | sed 's/[[:space:]]//g' 
  # echo "line"$line
  # Package_line=$line| jq '.Package'
  # Version_line=$line| jq '.Version'
  # License_Id_line=$line| jq '.License Id'
  # License_conditions_line=$line| jq '.License conditions'
  # content+= "\n|"$Package_line"|"$Version_line"|"$License_Id_line"|"$License_conditions_line"\n|"
  # echo "content:"$content

  
  line=$(echo $line | sed 's/[[:space:]]//g' | sed 's/{//g' |  sed 's/}//g' ) 
  echo $line 
  line_1=$(echo $line | awk -F'","' '{print $1}')
  echo $line_1 
  
  line_1_head=$(echo $line_1 | awk -F'":' '{print $1}' | sed 's/"//g')
  line_1_body=$(echo $line_1 | awk -F'":' '{print $2}' | sed 's/"//g')
  echo $line_1_head $line_1_body
  
  line_2=$(echo $line | awk -F'","' '{print $2}' ) 
  echo $line_2
  line_2_head=$(echo $line_2 | awk -F'":' '{print $1}' | sed 's/"//g')
  line_2_body=$(echo $line_2 | awk -F'":' '{print $2}' | sed 's/"//g')
  
  echo $line_2_head $line_2_body
  
  line_3=$(echo $line | awk -F'","' '{print $3}' ) 
  echo $line_3
  line_3_head=$(echo $line_3 | awk -F'":' '{print $1}' | sed 's/"//g')
  line_3_body=$(echo $line_3 | awk -F'":' '{print $2}' | sed 's/"//g')
  
  echo $line_3_head $line_3_body
  
  line_4=$(echo $line | awk -F'","' '{print $4}' ) 
  echo $line_4
  line_4_head=$(echo $line_4 | awk -F'":' '{print $1}' | sed 's/"//g')
  line_4_body=$(echo $line_4 | awk -F'":' '{print $2}' | sed 's/"//g')
  
  echo $line_4_head $line_4_body


  #tiele=" \n|Package-string|Version-string|License Id string|License conditions string| \n"
  #content=" \n| Package-string|Version-string|License Id string|License conditions string"
  tiele=" \\n|Package-string|Version-string|License Id string|License conditions string| \\n"
  content=" \\n| Package-string|Version-string|License Id string|License conditions string" "\\n|"$content$content

  #tiele= '\n|'$line_1_head'|'$line_2_head'|'$line_3_head'|'$line_4_head'|\n'
  #content='\n|'$line_1_body'|'$line_2_body'|'$line_3_body'|'$line_4_body$content
done< ${json_file_path}


echo -e "tiele""$tiele"
echo -e "content""$content"
#head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License conditions string|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'
#head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License conditions string|\n|Package-string2|Version-string2|License Id string2|License conditions string2|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'
# shellcheck disable=SC2089
# shellcheck disable=SC2016
head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License conditions string|\n|Package-string2|Version-string2|License Id string2|License conditions string2|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'
#head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\n Package: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string \n", "markdown": "**dep-scan-results**\n| '${tiele} '| \n| --- | --- | --- | --- | \n|'${content}'|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'

ls -l
#echo  $head | sed 's/} {/}\\n{/g'>1.sarif
echo  $head | sed 's/} {/}\\n{/g'>${licens_sarif_path}
