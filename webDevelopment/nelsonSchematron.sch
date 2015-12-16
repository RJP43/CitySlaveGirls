<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    
    <pattern>
        <rule context="tei:div[@type='articleBody']">
            <report test="not(tei:p or tei:said or tei:placeName or tei:persName or tei:orgName or tei:rs or tei:seg or tei:w or tei:damage or tei:unclear or tei:supplied or tei:choice or tei:sic or tei:reg)">Incorrect element. Your xml can only include: said, placeName, persName, orgName, rs, seg, w, damage, unclear, supplied, choice, sic, and reg.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:said">
            <report test="not(@ana and @who)">Element 'said' must contain both @who and @ana.</report>
        </rule>
    </pattern>
    
    
    <let name="si" value="doc('siteIndex.xml')//@xml:id"/>
    <pattern>
        <rule context="@ref|@resp|@corresp|@who|tei:w[@type='noun']/@ana|tei:w[@subtype='poss']/@ana">
            <let name="tokens" value="for $i in tokenize(., '\s+') return substring-after($i,'#')"/>
            <assert test="every $token in $tokens satisfies $token = $si">The attribute (after the hashtag, #) must match a defined @xml:id in the Site Index file!</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:w[@subtype='poss']">
            <report test="not(@type='adj')">The possessive pronoun must be listed as @type='adj', not '@noun'</report>
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
    
    
<!--    <pattern>
        <rule context=" tei:text//tei:placeName">
            <report test="if (@ref) then (@type='address') else (not(@ref))">Does this fire?</report>
        </rule>
    </pattern>-->
<!-- ras: greedy match and also unnecessary -->
    
    
     <pattern>
        <rule context="tei:rs">
            <assert test="@type = 'interruption'">Element 'rs' must only be used for an interrupted sentence within element 'said'.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:orgName">
            <report test="not(@ref)">Element 'orgName' must contain @ref.</report>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:seg">
            <assert test="count(tei:w) &gt; 1">Element seg' must contain more than one 'w' element.</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:w">
            <assert test="@type=('adj','noun')">@type may only be: adj or noun</assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:seg/*">
            <assert test="matches (./name(), 'w')">Element 'seg' can only contain element 'w.'</assert>
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
    
    <!-- rjp 2015-12-14: we need rules declaring the attributes for damage (found in codeBook) and we also need rules saying that the self closing damage element will always be followed by the unclear element which will always contain the supplied element and the supplied element has to have a resp attribute  -->
    
    
<!--    <pattern>
        <rule context="">
            <assert></assert>
        </rule>
    </pattern>-->
    
    
</schema>