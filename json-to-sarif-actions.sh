#!/bin/bash
#name=$1
#yum install -y  jq
sudo apt-get -y install jq
json_file_path=$1
licens_sarif_path=$2

head=""


#json_file_path=$(cat license-go.json | sed 's/[[:space:]]//g' | sed 's/"/\\"/g' ) 

json_str=$(cat ${json_file_path} | sed 's/[[:space:]]//g' | sed 's/"/\\"/g' ) 
echo -e $json_str

content=""

cat $json_file_path | while read line || [[ -n ${line} ]];
do

  line=$line | sed 's/[[:space:]]//g' 
  echo "line"
  Package_line=$line| jq '.Package'
  Version_line=$line| jq '.Version'
  License_Id_line=$line| jq '.License Id'
  License_conditions_line=$line| jq '.License conditions'
  content+= "\n|"$Package_line"|"$Version_line"|"$License_Id_line"|"$License_conditions_line"\n|"
  echo "content:"$content

done



#head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License conditions string|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'
#head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License conditions string|\n|Package-string2|Version-string2|License Id string2|License conditions string2|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'
head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License conditions string|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "xx.sarif", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path xx.sarif ", "id": "default" }, "analysisTarget": { "uri": "xx.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "xx.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'

ls -l
#echo  $head | sed 's/} {/}\\n{/g'>1.sarif
echo  $head | sed 's/} {/}\\n{/g'>${licens_sarif_path}
