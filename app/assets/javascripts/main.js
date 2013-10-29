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
        //hides question by index of questions array
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
        //determines results based on score and redirects to todaysapple subscription page
        console.log("Your parenting style is: " + results[String(score)]);
        $("#progress").removeClass();
        setTimeout(function() { survey.redirectToSubscription(); }, 5000);
    },
    redirectToSubscription: function() {
        window.location = "http://todaysapple.com/todays-apple-survey/?parentingstyle=" + results[String(score)];
    }
};

$(window).ready(function() {
    $(".question").addClass("hidden-question");
    survey.toggleQuestion(i);

    //event listener for clicking next
    $("#next-button").click(function() {
        if ($("input[type=radio]:checked").size() > 0) {
            survey.toggleQuestion(i);
            i++;
            survey.getAnswerValue();
            survey.toggleQuestion(i);
            $("input[type=radio]").prop('checked', false);
            if (i === $(".question").length) {
                $("#next-button").remove();
                survey.getScore();
                console.log(answers);
                console.log(score);
                survey.getResults(score);
            }
        }
    });

    //event listener for clicking back
    //temporarily remove back button; not fully built out with functionality for removing answers
    // $("#back-button").click(function() {
    //     if (i > 0) {
    //         survey.toggleQuestion(i);
    //         i--;
    //         survey.toggleQuestion(i);
    //     }
    // });
});