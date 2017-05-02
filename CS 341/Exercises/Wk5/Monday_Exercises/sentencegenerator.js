var articles = ["the", "a", "one", "some", "any"];
var nouns = ["boy", "girl", "dog", "town", "car"];
var verbs = ["drove", "jumped", "ran", "walked", "skilled"];
var prepositions = ["to", "from", "over", "under", "on"];

window.onload=function(){
    document.getElementById("generateButton").addEventListener("click", start);
}

function generateSentence() {
    var randArticleIndex1 = Math.floor(0 + Math.random()*5);
    var randNounIndex1 = Math.floor(0 + Math.random()*5);
    var randVerbIndex = Math.floor(0 + Math.random()*5);
    var randPrepIndex = Math.floor(0 + Math.random()*5);
    var randArticleIndex2 = Math.floor(0 + Math.random()*5);
    var randNounIndex2 = Math.floor(0 + Math.random()*5);

    var thisArticle1 = articles[randArticleIndex1];
    var thisNoun1 = nouns[randNounIndex1];
    var thisVerb = verbs[randVerbIndex];
    var thisPrep = prepositions[randPrepIndex];
    var thisArticle2 = articles[randArticleIndex2];
    var thisNoun2 = nouns[randNounIndex2];

    // Capitalize first letter of thisArticle1 because it is the first word in the sentence.
    thisArticle1 = thisArticle1.charAt(0).toUpperCase() + thisArticle1.slice(1);

    var sentence = thisArticle1 + " " + thisNoun1 + " " + thisVerb + " " + thisPrep;
    sentence += " " + thisArticle2 + " " + thisNoun2 + ". ";
    return sentence;
}

function start() {
    var sentenceCount = 20;
    var story = "Once upon a time...";
    for (i = 0; i < sentenceCount; i++) {
        story += generateSentence();
    }
    // Finish the story
    story += "THE END"

    // Write the story into the textarea.
    document.getElementById("story").innerHTML = story;
}
