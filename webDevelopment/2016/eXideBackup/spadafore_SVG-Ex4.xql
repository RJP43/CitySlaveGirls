xquery version "3.0";
declare default element namespace "http://www.w3.org/2000/svg"; 
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $nelsonColl := collection('/db/Nelson/ChicagoTimes_XML_gender/');
declare variable $artColls := $nelsonColl/*;
declare variable $dates := $artColls//tei:text//tei:title/tei:date;

declare variable $countArts := count($artColls);

declare variable $lineSpace := 100;
declare variable $barSpace := 1;

<svg height="1000" width="1500">
    <g transform="translate(40, 475)">
    
        <line x1="0" y1="0" x2="{$lineSpace * ($countArts)}" y2="0" style="stroke:purple;stroke-width:4;"/>
        <text x="{$lineSpace * ($countArts) div 2}" y="-445" style="text-anchor: middle">Count of Nouns and Adjectives per Article</text>
        
        <line x1="{$lineSpace * ($countArts) + 40}" y1="-250" x2="{$lineSpace * ($countArts) + 60}" y2="-250" style="stroke:red;stroke-width:10;"/>
        <text x="{$lineSpace * ($countArts) + 65}" y="-245">Count of Nouns</text>
        <line x1="{$lineSpace * ($countArts) + 40}" y1="-230" x2="{$lineSpace * ($countArts) + 60}" y2="-230" style="stroke:pink;stroke-width:10;"/>
        <text x="{$lineSpace * ($countArts) + 65}" y="-225">Count of Adjectives</text>
        
        
        {
        for $artColl at $pos in $artColls
        let $nouns := $artColl//tei:text//tei:w[@type="noun"]
        let $nounsCount := count($nouns) div 2
        let $adjs := $artColl//tei:text//tei:w[@type="adj"]
        let $adjsCount := count($adjs) div 2
        let $date := $artColl//tei:teiHeader//tei:titleStmt//tei:date/text()
        
        return
            <g>
            <line x1="{(($pos - 1) * $lineSpace) + 35}" x2="{(($pos - 1) * $lineSpace) + 35}" y1="{-2}" y2="{-2-$nounsCount * $barSpace}" style="stroke:red;stroke-width:18;"/>
            <line x1="{(($pos - 1) * $lineSpace) + 65}" x2="{(($pos - 1) * $lineSpace) + 65}" y1="{-2}" y2="{-2-$adjsCount * $barSpace}" style="stroke:pink;stroke-width:18;"/>
            
            <text x="{((($pos - 1) * $lineSpace)+ ($pos * $lineSpace)) div 2}" y="10" style="writing-mode: tb;">{$date}</text>
            
            </g>
        }
    </g>
</svg>
