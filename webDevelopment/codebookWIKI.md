#Project Codebook  
Here is where you can find all of the rules governing the markup we use on this project.  
  
###Rule #1 UNCLEAR TEXT
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
  
  
###Rule #2 ODD SPELLING
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
  
  
###Rule #3  GRAMMATICAL MARKUP
>Word Binding: 
  
The only grammatical markup that the project is currently (Spring 2016) using is the processing of possessive adjectives and the associated noun(s).  
Each word is wrapped in a `<w>` element, the group of words then sits inside of a `<phr>` element.  
In order to give context to these groupings we also grab as much of the surrounding text necessary to make sense of who the agent and object are and place this inside of a `<seg>` element.  
  
Explanation of Attributes:  
  
`<w>`  
*  `@type` values:  *declaration of the type of word*  
        type="adj" :arrow_right: *indicates the word is an adjective*  
        type="noun" :arrow_right: *indicates the word is a noun*  
*  `@subtype` values: *declaration of further description of the word*  
        subtype="poss" :arrow_right: *indicates the adjective is a possessive agent*  
        subtype="refTo" :arrow_right: *indicates the noun as an object of the possessive agent is in reference to a organization or archetype found in the site index*  
*  @ana values: *indicates what entity from the site index holds possession or is being possessed*  
        ana="#xml:id :arrow_right: *(orgName xml:id, name xml:id, archetype xml:id)*  
  
>>Example:  
`<seg>After a few moments Mr.  Oleson said the girl was one of the best in <phr><w type="adj" subtype="poss" ana="#employer">his</w> <w type="noun" subtype="refTo" ana="#workingGirl">employ</w></phr>, that nothing could be said against <phr><w type="adj" subtype="poss" ana="#workingGirl">her</w> <w type="noun">work</w></phr> or <phr><w type="adj" subtype="poss" ana="#workingGirl">her</w> <w type="noun">character</w></phr>, and he would be willing to take her back.</seg>`  
  
  
###Rule #4  Version Control between Sources
>Versioning of texts:  
  
Use the `<app>` element to hold the two distinct readings, `<rdg>`, for each source text.  
In the an `<rdg>` specify which source is associated with the particular reading in the `@wit` attribute.  

  
Explanation of Attributes:  
  
`<reg>`  
* `@resp` values:  *declaration of who is responsible for the interpretation of text*  
        resp="#yourInitials" :arrow_right: *the # is a reference indicator to the xml:id that each editor should have in our site index*  
  
>>Example 1:  *version control with inline elements*  
`Nell Nelson, in a recent article in THE TIMES, described the trousers manufactory of <orgName ref="#KBO" type="exposedCompany"><app><rdg wit="#CT021">K. B. Oleson</rdg><rdg wit="#WSGC23">K.B.O.</rdg></app></orgName>, on <placeName type="address" ref="#KBO"><app><rdg wit="#CT021">Sedgwick</rdg><rdg wit="#WSGC23">S.</rdg></app> street near Division</placeName>, as a two-story and basement frame, the stories being used for girls and the basement for horses.`  
  
  











