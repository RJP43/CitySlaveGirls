<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/><!-- ras: I added this line to see if this would work, it doesn't help. -->
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
            <assert test="@who=('unidentified','workingGirl','nellNelson','foreperson','employer','employee','benefactor','messenger')">
                @who may only be: unidentified, workingGirl, nellNelson, foreperson, employer, employee, benefactor, or messenger.</assert>
        </rule>
    </pattern>
    <!-- ras: also not working? This should work, its essentially the same code as my schematron 1 hw. -->
    
    
    <pattern>
        <rule context="tei:said">
            <assert test="@ana=('male','female','unknown')">@ana may only be: male, female, or unknown.</assert>
        </rule>
    </pattern>
    <!-- ras: same as the previous rule, still not firing. I tried to write it differently this time, and its still not working: @ana[matches(., 'male')] | @ana[matches(., 'female')] | @ana[matches(., 'unknown')] -->
    
    
    <pattern>
        <rule context="tei:placeName">
            <assert test="@type=('address','ref')">@type may only be: address or ref.</assert>
        </rule>
    </pattern>
    
    
    <!--<pattern>
        <rule>
            <assert test=""></assert>
        </rule>
    </pattern>-->
    
    
</schema>