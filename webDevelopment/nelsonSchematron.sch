<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    
    <pattern>
        <rule context="tei:body">
            <report test="not(tei:div or tei:head or tei:title or tei:list or tei:item or tei:p or tei:said or tei:placeName or tei:persName or tei:orgName or tei:name or tei:seg or tei:w or tei:phr or tei:damage or tei:unclear or tei:supplied or tei:choice or tei:sic or tei:reg or tei:hi)">Incorrect element. Your xml can only include: div, head, title, list, item, p, said, placeName, persName, orgName, name, seg, w, phr, damage, unclear, supplied, choice, sic, reg and hi.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:said">
            <report test="not(@ana and @who)">Element 'said' must contain both @who and @ana.</report>
        </rule>
    </pattern>
    
    
    <let name="si" value="doc('siteIndex.xml')//@xml:id"/>
    <pattern>
        <rule context="@ref|@resp|@corresp|@who|tei:w[@type='noun']/@ana|tei:w[@type='poss']/@ana|tei:rdg/@wit">
            <let name="tokens" value="for $i in tokenize(., '\s+') return substring-after($i,'#')"/>
            <assert test="every $token in $tokens satisfies $token = $si">The attribute (after the hashtag, #) must match a defined @xml:id in the Site Index file!</assert>
        </rule>
    </pattern>
    
    <!--2015-12-12 ebb: In addition to this, you need to add a tei: prefix to each element. NOTE: You don't need to add the tei: prefix to attributes, but only ahead of any and every element name!
    It's a TEI thing, and affects some programming differently from others. (We can handle the namespace in XSLT with just a line in the stylesheet rule at the top, but
    Schematron requires more specificity on each rule. 
    It's working now! -->
    
    
    <!-- Here are some lines I pulled from my Amadis project schematron that we'll adapt to your project when Becca has the Site Index ready: 
   
   <let name="si" value="doc('SI-Amadis.xml')//@xml:id"/>
  <let name="siFile" value="doc('SI-Amadis.xml')"/>  
  
  This sets up a couple of handy global variables when you have it sitting OUTSIDE a pattern, and we can call on it with  $si and $siFile inside patterns like this:
  
  <pattern>
    <rule context="@ref | @resp | @corresp">
      <let name="tokens" value="for $i in tokenize(., '\s+') return substring-after($i,'#')"/>
      <assert test="every $token in $tokens satisfies $token = $si">The attribute (after the hashtag, #) must match a defined @xml:id in the Site Index file!</assert>
    </rule>
  </pattern>
  
  OK: this is a little more maybe than what you need: In the Amadis project, we use @ref, @resp, and @corresp with "#" in the attribute values that point to XML:ids in the site index. 
  Sometimes there are multiple values for those attributes, separated by a white space, so this is a neat little pattern that helps us break up each individual #id value in a 
  white-space separated list, and then see if they meet a "satisfies" test, one by one, to be equal to an xml:id in the Site Index file. This is some new Schematron (and XSLT) syntax for you!
  The words "some", "every" and "satisfies" are used to test for a condition that applies to a sequence. You can read more about it in Michael Kay, p. 646. 
    -->
    
    
    <pattern>
        <rule context="tei:w">
            <report test="@type='poss' and @subtype='refTo'">'@subtype' can only appear on '@type='noun.'</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:w">
            <report test="@subtype='refTo' and not(@ana)">'@subtype' can only appear on nouns with '@ana' (the reference to a noun with an xml:id must be labelled with the xml:id being referenced)</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:said">
            <assert test="@ana = ('male','female','unknown')">@ana may only be: male, female, or unknown.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:text//tei:placeName">
            <report test="not(@type)">Element 'placeName' must contain @type.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:text//tei:placeName">
            <assert
                test="@type = ('address','locRef','country','state','city')">@type may only be: address, locRef (location reference), city, state, or country.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context=" tei:text//tei:placeName">
            <report test="@type='address' and not(@ref)">Addresses must have a corresponding @ref.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context=" tei:text//tei:placeName">
            <report test="not(@type='address') and @ref">Only addresses have a corresponding @ref.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:orgName">
            <report test="not(@ref)">Element 'orgName' must contain @ref.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:phr">
            <assert test="count(.//tei:w) &gt; 1">Element 'phr' must contain more than one 'w' element.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:w">
            <assert test="@type=('poss','noun')">@type may only be: adj or noun</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:phr/*">
            <assert test="matches (./name(), 'w') or matches (./name(), 'placeName') or matches (./name(), 'persName') or matches (./name(), 'orgName') or matches (./name(), 'name')">Element 'phr' can only contain element 'w' (or 'placeName,' 'persName,' 'orgName,' or 'name' for proper nouns acting as possessive nouns).</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context='tei:seg'>
            <assert test='count(.//tei:phr) &gt; 0'>Element 'seg' must contain one or more 'phr' elements.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:choice">
            <report test="not(tei:sic or tei:reg)">Element 'choice' can only contain elements 'sic' and 'reg.'</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:choice">
            <assert test="(count(tei:sic) = 1) and (count(tei:reg) = 1)">Element 'choice' must contain 1 'sic' and 1 'reg.'</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:damage">
            <assert test="following-sibling::tei:unclear">'damage' must be followed by 'unclear.'</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:supplied">
            <assert test="parent::tei:unclear">Element 'supplied' must be contained within element 'unclear.'</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:supplied">
            <report test="not(@resp)">Element 'supplied' must have attribute @resp containinng editor's xml:id.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:hi">
            <report test="not(@rend)">Elemnt 'hi' must contain attribute '@rend.'</report>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:hi">
            <assert test="@rend = ('single','double')">Attribute '@rend' can only be set to 'single' or 'double.'</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:name">
            <report test="not(@ref)">Element 'name' must contain attribute @ref.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:app">
            <assert test="count(./tei:rdg) = 2">Every element 'app' must have 2 'rdg' elements.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:rdg">
            <report test="not(@wit)">Element 'rdg' must have atribute @wit.</report>
        </rule>
    </pattern>
    
<!--    <pattern>
        <rule context="">
            <assert></assert>
        </rule>
    </pattern>-->
    
    
</schema>