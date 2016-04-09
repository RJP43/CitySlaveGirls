#Project Codebook  
Here is where you can find all of the rules governing the markup we use on this project.  
For ease of reading the examples for each rule only contain the markup discussed in that particular rule.  
Please reference any of our [complete articles]() for example of full text markup!
  
###Rule #1 UNCLEAR Text
>Coding text that is unreadable or difficult to transcribe:  
  
Use the `<damage>` element for when some aspect of the text is difficult to read.  
Follow with the `<unclear>` and `<supplied>` in combination and make a reasonable attempt at what text is missing.  
Your reading should sit within the `<unclear><supplied>...your reading...</supplied></unclear>` tag set.  
If you cannot read the text at all still provide the `<damage>` tag and follow it with a self-closing `<unclear/>` leaving out the `<supplied>` element.  
  
Explanation of Attributes:  
  
`<damage>`  
* `@unit` values:  
        unit="word" :arrow_right: *missing entire word*  
        unit="chars" :arrow_right: *missing "characters" of a word*  
        unit="sentence" :arrow_right: *missing complete sentence*  
* `@quantity` values:  
        quantity="#" :arrow_right: *referring to the previously determined unit -- how many units are unclear?*  
* `@agent` values:  *why the text is unreadable*
        agent="blurred" :arrow_right: *poor photographic image quality*  
        agent="fold" :arrow_right: *document fold blocking text*  
        agent="torn" :arrow_right: *tear in the document causes missing text*  
  
`<supplied>`  
* `@resp` values:  *declaration of who is responsible for the interpretation of text*  
        resp="#yourInitials" :arrow_right: *the # is a reference indicator to the xml:id that each editor should have in our site index*  
  
>>Example:  
`Simply put <damage agent="blurred" unit="word" quantity="9"/><unclear><supplied resp="#rjp">your best guess here to what the text says</supplied></unclear>.`  
  
  
###Rule #2 ODD Spelling
>Coding idiosyncratic and standard spellings:   
  
Use the `<choice>` element for when the author of the text uses an unfamiliar spelling of a word.  
We do this so we don't think the oddities are typos in the transcription.  
Follow `<choice>` with `<sic>`, which contains the word as it appears in the original text.  
Then put `<reg>`, which contains your correction indicating the more modern or known spelling of the word.  
  
Explanation of Attributes:  
  
`<reg>`  
* `@resp` values:  *declaration of who is responsible for the interpretation of text*  
        resp="#yourInitials" :arrow_right: *the # is a reference indicator to the xml:id that each editor should have in our site index*  
  
>>Example:  
`At one side of the west wall, separated by a ten-foot pine partition, was the toilet-room containing an iron <choice><sic>zinc</sic><reg resp="#rjp">sink</reg></choice> with one faucet of running water.`  
  
  
###Rule #3  Grammatical Markup
>Word Binding: 
  
The only grammatical markup that the project is currently (Spring 2016) using is the processing of possessive adjectives and the associated noun(s).  
Each word is wrapped in a `<w>` element, the group of words then sits inside of a `<phr>` element.  
In order to give context to these groupings we also grab as much of the surrounding text necessary to make sense of who the agent and object are and place this inside of a `<seg>` element.  
  
Explanation of Attributes:  
  
`<w>`  
*  `@type` values:  *declaration of the type of word*  
        type="poss" :arrow_right: *indicates the word is possessive*  
        type="noun" :arrow_right: *indicates the word is a noun*  
*  `@subtype` values: *declaration of further description of the word*  
        subtype="refTo" :arrow_right: *indicates the noun as an object of the possessive agent is in reference to a organization or archetype found in the site index*  
*  @ana values: *indicates what entity from the site index holds possession or is being possessed*  
        ana="#xml:id :arrow_right: *(orgName xml:id, name xml:id, archetype xml:id)* (See Rules 5-7) 
  
>>Example:  
`<seg>After a few moments Mr.  Oleson said the girl was one of the best in <phr><w type="poss" ana="#employer">his</w> <w type="noun" subtype="refTo" ana="#workingGirl">employ</w></phr>, that nothing could be said against <phr><w type="poss" ana="#workingGirl">her</w> <w type="noun">work</w></phr> or <phr><w type="poss" ana="#workingGirl">her</w> <w type="noun">character</w></phr>, and he would be willing to take her back.</seg>`  
  
  
###Rule #4  Version Control between Sources
>Versioning of texts:  
  
Use the `<app>` element to hold the two distinct readings, `<rdg>`, for each source text.  
In the a `<rdg>` specify which source is associated with the particular reading in the `@wit` attribute.  
For versioning that occurs on a persName, orgName, etc. place the other inline element outside of the `<app>` and `<rdg>` elements.
If entire sections (paragraphs, headlines, etc.) are missing from one text place the `<app>` and first `<rdg>` `@wit` pointing to the avaqilable text inside of the structural markup element (`<p>`, `<item>`, etc.) then at the end before the closing structural element tag add an empty `<rdg>` element with the `@wit` of the source text that is missing the text.  
  
Explanation of Attributes:  
  
`<rdg>`  
* `@wit` values:  *declaration of source text identifier*  
        resp="#xml:id" :arrow_right: *the # is a reference indicator to the xml:id from the site index for the specific document the text is versioning from*  
  
>>Example 1:  *version control with inline elements*  
`Nell Nelson, in a recent article in THE TIMES, described the trousers manufactory of <orgName ref="#KBO" type="exposedCompany"><app><rdg wit="#CT021">K. B. Oleson</rdg><rdg wit="#WSGC23">K.B.O.</rdg></app></orgName>, on <placeName type="address" ref="#KBO"><app><rdg wit="#CT021">Sedgwick</rdg><rdg wit="#WSGC23">S.</rdg></app> street near Division</placeName>, as a two-story and basement frame, the stories being used for girls and the basement for horses.`  
>>Example 2:  *version control with structural elements*  
`<item><app><rdg wit="#CT021">A <hi rend="double">Times</hi> Reporter Gets Into a Paper-Box Manufacatory That Puzzles and Bewilders Him.</rdg><rdg wit="#WSGC23"></rdg></app></item>`  
  
  
###Rule #5 Organizations
>Coding names of organizaions:   
  
Use the `<orgName>` element to mark ANY reference to an organization (distinction between exposed companies and other organizations are made in the `@type` attribute.  
Every organization should get an `@ref` attribute that points into the site index (while transcribing reference the site index first to be sure organization doesn't already have an xml:id, if it does not add an entry to the site index assigning a unique identifier to the organization).  
Sometimes a company is listed just under an employer's last name without any real indication of the company's full name, when this happens mark the text as both a `<persName>` and `<orgName>` (the `<orgName>` should include apostrophes when they are present, whereas the `<persName>` just grabs the last name).  
If a company is discussed only with a single word (even if it is a last name of an employer) and apostrophe it is only necessary to mark it as an `<orgName>`.  
  
Explanation of Attributes:  
  
`<orgName>`  
* `@ref` values:  *declaration of organization's unique identifier*  
        ref="#xml:id" :arrow_right: *the # is a reference indicator to the xml:id that each organization should have in our site index*  
* `@type` values:  
        type="exposedCompany" :arrow_right: *used only if organization is a company being exposed (conditions of the company are disucussed or address of company is revealed) by the series*  
  
>>Examples:  
`<orgName ref="#Brougham" type="exposedCompany">Brougham's packing-house</orgName>`  
`The place of servitude is at 1187 Milwaukee avenue and the proprietors are <orgName ref="#Schlessinger" type="exposedCompany">Mr. and Mrs. <persName ref="#employer">Schlessinger</persName> and son</orgName>`  
`<orgName type="exposedCompany" ref="#Olson">Olson's</orgName>`  
`<orgName ref="#WoChrist">Woman's Christian boarding-house</orgName>`  
  
  
###Rule #6 Places and Addresses
>Coding names and references to place and location:   
  
Use the `<placeName>` element to mark ANY reference to a place.  
This includes just general references to places in Chicago and outside of Chicago as well as exact addresses of the places exposed by the series.  
  
Explanation of Attributes:  
  
`<placeName>`  
* `@type` values:  
        type="address" :arrow_right: *used for exact locations of organizations and paired with the `@ref` attribute*  
        type="locRef" :arrow_right: *used for mention of a general place (park, street, landmark, etc.) in Chicago*  
        type="city" :arrow_right: *only used on city names* (Chicago gets includer here, not in `type="locRef"`  
        type="state" :arrow_right: *only used on state names*
        type="country" :arrow_right: *only used on country names*  
* `@ref` values:  *declaration of corresponding organization* (only used on `@type="address"`)  
        ref="#xml:id" :arrow_right: *the # is a reference indicator to the xml:id that each organization should have in our site index*  
  
>>Example:  
`I take a walk down <placeName type="locRef">Larrabee street</placeName>. At <orgName type="exposedCompany" ref="#Olson">Olson's</orgName>, on <placeName type="address" ref="#Olson">Sedgwick street near Superior</placeName>, I am taken.`  
  
  
###Rule #7 People and other Proper Names
>Coding proper names of people and the newspaper title when referenced:   
  
Use the `<persName>` element to mark proper names of people.  
Use the `<name>` element to mark references to the newspaper (_The Chicago Times_).  
  
Explanation of Attributes:  
  
`<persName>`  
* `@ref` values:  *declaration of archetype site index reference*  
        resp="#workingGirl"
  
`<name>`  
* `@ref` values:  *declaration of site index reference*  
        ref="#CT" :arrow_right: *the # is a reference indicator to the xml:id for _The Chicago Times_ in our site index*  
  
>>Example:  
`I take a walk down <placeName type="locRef">Larrabee street</placeName>. At <orgName type="exposedCompany" ref="#Olson">Olson's</orgName>, on <placeName type="address" ref="#Olson">Sedgwick street near Superior</placeName>, I am taken.`  
  
  








