xquery version "3.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
(:declare variable $ThisFileContent := :)
(: string-join( :)
let $nellColl := collection('/db/Nelson/CSG_XML')
let $nellFile := $nellColl/*
let $fileDates := $nellFile//teiHeader//fileDesc//title//date/@when/string()
let $fileNums := $nellFile//teiHeader//fileDesc//title/@corresp/substring-after(.,'CT0')
let $phrases := $nellFile//phr
let $agents := $phrases/w[@type="adj"]
let $objects := $phrases/w[@type="noun"]
for $agent in $agents
let $agentValue := 
if ($agent[@ana]) then ($agent/@ana/substring-after(.,'#'))
else $agent/string()
let $correspObjects := 
if ($agent/parent::phr/w[@type="noun"][@ana]) then ($agent/parent::phr/w[@type="noun"][@ana]/@ana/substring-after(.,'#'))
else $agent/parent::phr/w[@type="noun"]/string()
let $edge := $agent/parent::phr
let $edgeName := "possesses"
for $obts in $correspObjects

return concat($agentValue, "&#x9;", $edge, "&#x9;", $obts, "&#10;")

(:return concat($agentValue, "&#x9;", $agtWordType, "&#x9;", $edge, "&#x9;", $obts, "&#x9;", $objWordType,) "&#10;"):)
(:;:)
(:let $filename := "nelsonOutput.tsv":)
(:let $doc-db-uri := xmldb:store("/db/rParker", $filename, $ThisFileContent, "text/plain"):)
(:return $doc-db-uri:)
(:output = http://dxcvm05.psc.edu:8080/exist/rest/db/rParker/nelsonOutput.tsv:)

