#!/bin/bash
a=""
json_file="111111111111.\n 22222.\n 444.\n"
json_file='{"Package": "github.com/hashicorp:golang-lru", "Version": "v0.5.0", "License Id": "MPL-2.0", "License conditions": "disclose-source, include-copyright, same-license--file"} {"Package": "github.com/hashicorp:golang-lru", "Version": "v0.5.1", "License Id": "MPL-2.0", "License conditions": "disclose-source, include-copyright, same-license--file"}'
echo $json_file
json_file=$(cat license-go.json | sed 's/[[:space:]]//g' | sed 's/"/\\"/g' ) 

echo -e $json_file

a='{ "$schema": "https://schemastore.azurewebsites.net/schemas/json/sarif-2.1.0-rtm.5.json", "version": "2.1.0", "properties": { "comment": "This sample demonstrates the use of default rule configuration." }, "runs": [ { "tool": { "driver": { "name": "SarifSamples", "version": "1.0", "rules": [ { "id": "TUT0001", "defaultConfiguration": { "level": "warning", "properties": { "comment": "'"'warning' is the default, so this can be omitted.\" } } } ] } }, \"results\": [ { \"ruleId\": \"TUT1001\", \"ruleIndex\": 0, \"message\": { \"text\": \"${json_file}\" }, \"locations\": [ { \"physicalLocation\": { \"artifactLocation\": { \"uri\": \"licens.sarif\" } } } ] } ], \"columnKind\": \"utf16CodeUnits\" } ] }"

echo  $a | sed 's/} {/}\\n{/g'>1.sarif
