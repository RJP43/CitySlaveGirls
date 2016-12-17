xquery version "3.0";
declare default element namespace "http://www.w3.org/2000/svg"; 
declare namespace tei="http://www.tei-c.org/ns/1.0"; 
declare variable $genderColl := collection('/db/Nelson/ChicagoTimes_XML_gender/');
declare variable $genderFile := $genderColl/*;
let $fileDates := $genderColl//tei:teiHeader//tei:fileDesc//tei:title//tei:date/@when/string()
let $fileNum := $genderFile//tei:teiHeader//tei:fileDesc//tei:title/@corresp/substring-after(.,'CT')
let $countFiles := count($genderFile)
let $peeps := $genderFile//tei:said/@who/substring-after(.,"#")
let $distinctPeeps := distinct-values($peeps)
let $dPeepArray:=
        for  $dpeep in $distinctPeeps
        let $countPeep := count($peeps[.= $dpeep])
        order by $countPeep
        return $dpeep
for $dp at $pos in $dPeepArray
return ($dp, $pos)
