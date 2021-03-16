# -*- coding: utf-8 -*-
import time
import string
import datetime
import os
import json
import sys
nowDate=1
#nowDate=time.strftime("%Y-%m-%d-%h-%m-%s", time.localtime())
if len(sys.argv)!=3:
  print ("Error,parameter is incorrect.")
  exit()
json_file_path=""
#json_file_path="./license-go.json"
#Only service specific types of data,On runner
#{"Package": "github.com/hashicorp:golang-lru", "Version": "v0.5.0", "License Id": "MPL-2.0", "License conditions": "disclose-source, include-copyright, same-license--file"}
licens_sarif_name=""
#licens_sarif_name = './1.sarif'

json_file_path = sys.argv[1]
licens_sarif_name = sys.argv[2]


line_number = 0
content=""

sarif_file_content=""
with open(json_file_path, 'r') as file:
    for line in file:
        #if head != 0:
        #print (line);
        # print line.split(",")
        line=line.replace(" ", "")
        line = line.replace("},", "")
        line = line.replace("{", "")
        line = line.replace("}", "")
        # "," splite
        line_1 = line.split("\",\"")[0].strip()
        line_2 = line.split("\",\"")[1].strip()
        line_3 = line.split("\",\"")[2].strip()
        line_4 = line.split("\",\"")[3].strip()
        print(line_1);
        print(line_2);
        print(line_3);
        print(line_4);

        #":" splite
        line_1_head = line_1.split("\":\"")[0].strip().replace("\"", "")
        line_1_body = line_1.split("\":\"")[1].strip().replace("\"", "")
        print("line_1_head:"+line_1_head);
        print("line_1_body:"+line_1_body);

        #":" splite
        line_2_head = line_2.split("\":\"")[0].strip().replace("\"", "")
        line_2_body = line_2.split("\":\"")[1].strip().replace("\"", "")
        print("line_2_head:"+line_2_head);
        print("line_2_body:"+line_2_body);


        #":" splite
        line_3_head = line_3.split("\":\"")[0].strip().replace("\"", "")
        line_3_body = line_3.split("\":\"")[1].strip().replace("\"", "")
        print("line_3_head:"+line_3_head);
        print("line_3_body:"+line_3_body);


        #":" splite
        line_4_head = line_4.split("\":\"")[0].strip().replace("\"", "")
        line_4_body = line_4.split("\":\"")[1].strip().replace("\"", "")
        print("line_4_head:"+line_4_head);
        print("line_4_body:"+line_4_body);
        tiele = line_1_head+"|"+line_2_head+"|"+line_3_head+"|"+line_4_head
        print("tiele:" + tiele);

        if line_number >= 1:
            content = content+ "|\\n|" +line_1_body + "|" + line_2_body + "|" + line_3_body + "|" + line_4_body
        else:
            content = line_1_body + "|" + line_2_body + "|" + line_3_body + "|" + line_4_body
        line_number+=1
    #head='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": "dep-scan-1", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\nPackage: Package-string\nVersion: Version-string\nLicense Id: License Id string\nLicense conditions: License-conditions string\n", "markdown": "**dep-scan-results**\n| Package | Version | License Id | License-conditions | \n| --- | --- | --- | --- | \n|Package-string|Version-string|License Id string|License-conditions string|\n|Package-string2|Version-string2|License Id string2|License-conditions string2|\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "temp.sarif", "id": "default" }, "analysisTarget": { "uri": "temp.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "temp.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path temp.sarif ", "id": "default" }, "analysisTarget": { "uri": "temp.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "temp.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'


print("____________________________________________")

print(line_number)
sarif_file_content = '{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": : "dep-scan-'+nowDate+'", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\\nPackage: Package-string\\nVersion: Version-string\\nLicense Id: License Id string\\nLicense-conditions: License-conditions string\\n", "markdown": "**dep-scan-results**\\n| '+tiele+ '| \\n| --- | --- | --- | --- | \\n|'+content+'|\\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "temp.sarif", "id": "default" }, "analysisTarget": { "uri": "temp.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "temp.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": "dep-scan-1", "ruleIndex": 0, "level": "error", "message": { "text": "The path temp.sarif ", "id": "default" }, "analysisTarget": { "uri": "temp.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "temp.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'

#sarif_file_content = '{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.4.json", "version": "2.1.0", "runs": [ { "tool": { "driver": { "name": "dep-scan", "fullName": "dep-scan-tools", "version": "0.0.0", "semanticVersion": "0.0.0", "dottedQuadFileVersion": "0.0.0.0", "rules": [ { "id": : "dep-scan-'+nowDate+'", "shortDescription": { "text": "dep-san title" }, "fullDescription": { "text": "dep-san full description" }, "help": { "text": "dep-scan-results\\nPackage: Package-string\\nVersion: Version-string\\nLicense Id: License Id string\\nLicense-conditions: License-conditions string\\n", "markdown": "**dep-scan-results**\\n| '+tiele+ '| \\n| --- | --- | --- | --- | \\n|'+content+'|\\n" } } ] } }, "logicalLocations": [ { "name": "dockerfile", "fullyQualifiedName": "dockerfile", "kind": "namespace" } ], "results": [ { "ruleId": "dep-scan-'+nowDate+'", "ruleIndex": 0, "level": "error", "message": { "text": "temp.sarif", "id": "default" }, "analysisTarget": { "uri": "temp.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "temp.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" }, { "ruleId": : "dep-scan-'+nowDate+'", "ruleIndex": 0, "level": "error", "message": { "text": "The path temp.sarif ", "id": "default" }, "analysisTarget": { "uri": "temp.sarif" }, "locations": [ { "physicalLocation": { "artifactLocation": { "uri": "temp.sarif" }, "region": { "startLine": 1, "startColumn": 1, "endLine": 1, "endColumn": 1, "byteOffset": 1, "byteLength": 1 } }, "logicalLocations": [ { "fullyQualifiedName": "dockerfile" } ] } ], "suppressions": [ { "kind": "external" } ], "baselineState": "unchanged" } ], "columnKind": "utf16CodeUnits" } ] }'

# coding=UTF-8

with open(licens_sarif_name, 'w') as file_object:
    file_object.write(sarif_file_content.strip())
