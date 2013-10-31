var i = 0,
    answers = [],
    score = 0;

//16 different parenting style outcomes based on score
var results = {};
results["1111"] = "ESTJ";
results["2111"] = "ESTP";
results["1211"] = "ESFJ";
results["2211"] = "ESFP";
results["1121"] = "ENTJ";
results["2121"] = "ENTP";
results["1221"] = "ENFJ";
results["2221"] = "ENFP";
results["1112"] = "ISTJ";
results["2112"] = "ISTP";
results["1212"] = "ISFJ";
results["2212"] = "ISFP";
results["1122"] = "INTJ";
results["2122"] = "INTP";
results["1222"] = "INFJ";
results["2222"] = "INFP";

var survey = {
    toggleQuestion: function(index) {
        //shows/hides question by index of questions array
        $("#question-number").text("Question: " + String(i+1) + "/" + String($(".question").length));
        $(".question:eq("+index+")").toggleClass("visible-question");
    },
    getAnswerValue: function() {
        //retrieves value associated with radio button
        var weight = parseInt($("input[type=radio]:checked").val());
        answers.push(weight);
    },
    getScore: function() {
        //calculates sum of values associated with all answers
        var j = 0,
            numberOfAnswers = answers.length;

        for (j; j < numberOfAnswers; j++) {
            score += answers[j];
        }
        return score;
    },
    getResults: function(score) {
        //determines results based on score and calls redirectToSubscription after 1.5seconds (enough time to finish progress animation)
        console.log("Your parenting style is: " + results[String(score)]);
        $("#progress").removeClass();
        setTimeout(function() {
                survey.redirectToSubscription();
            }, 1500
        );
    },
    redirectToSubscription: function() {
        //redirects to todaysapple subscription page
        window.location = "http://todaysapple.com/todays-apple-survey/?parentingstyle=" + results[String(score)];
    },
    increaseProgressBar: function(index) {
        var increment = (100 / $(".question").length);
        $(".bar").animate({
            width: String(increment * index) + "%"
        }, 400, "linear", survey.toggleQuestion(index));

        // if ($(".bar")) {

        // }
    }
};

$(window).ready(function() {
    $(".question").addClass("hidden-question");
    survey.toggleQuestion(i);

    //event listener for clicking the start button
    $("#start-button").click(function() {
        $("#start-button").addClass("hidden");
        $("#survey-description").addClass("hidden");
        $("#questions-panel").slideDown("slow");
    });

    //event listener for clicking next
    $("#next-button").click(function() {
        if ($("input[type=radio]:checked").size() > 0) {
            survey.toggleQuestion(i);
            i++;
            survey.getAnswerValue();
            survey.increaseProgressBar(i);
            // survey.toggleQuestion(i);
            $("input[type=radio]").prop('checked', false);
            if (i === $(".question").length) {
                $("#next-button").remove();
                $("#question-number").addClass("hidden");
                survey.getScore();
                console.log(answers);
                console.log(score);
                survey.getResults(score);
            }
        }
    });
});