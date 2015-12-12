<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/><!-- ras: I added this line to see if this would work, it doesn't help. -->
    
    
<!--    <pattern>
        <rule context="said">
            <assert test="@*=@who and @ana">Element 'said' must contain both @who and @ana.</assert>
        </rule>
    </pattern>-->
    <!-- ras: not working... yet... just playing around with constraining the use of attributes -->
    
    
    <pattern>
        <rule context="said">
            <assert test="@who=('unidentified','workingGirl','nellNelson','foreperson','employer','employee','benefactor','messenger')">@who may only be: unidentified, workingGirl, nellNelson, foreperson, employer, employee, benefactor, or messenger.</assert>
        </rule>
    </pattern>
    <!-- ras: also not working? This should work, its essentially the same code as my schematron 1 hw. -->
    
    
    <pattern>
        <rule context="said">
            <assert test="@ana=('male','female','unknown')">@ana may only be: male, female, or unknown.</assert>
        </rule>
    </pattern>
    <!-- ras: same as the previous rule, still not firing. I tried to write it differently this time, and its still not working: @ana[matches(., 'male')] | @ana[matches(., 'female')] | @ana[matches(., 'unknown')] -->
    
    
    <pattern>
        <rule context="placeName">
            <assert test="@type=('address','ref')">@type may only be: address or ref.</assert>
        </rule>
    </pattern>
    
    
    <!--<pattern>
        <rule>
            <assert test=""></assert>
        </rule>
    </pattern>-->
    
    
</schema>