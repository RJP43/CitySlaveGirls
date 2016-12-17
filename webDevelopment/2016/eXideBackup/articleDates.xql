xquery version "3.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
let $nelsonColl:=collection('/db/nelson/CSG_XML')/*
let $articleDates := $nelsonColl//fileDesc//date
where string-length(normalize-space($articleDates)) gt 0 
order by $articleDates
return <li><a href="getDateList.php?year={$articleDates}">{$articleDates}</a></li>

