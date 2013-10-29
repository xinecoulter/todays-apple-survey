var i = 0,
    answers = [],
    score = 0;

var survey = {
    toggleQuestion: function(index) {
        $(".question:eq("+index+")").toggleClass("visible-question");
    },
    getAnswerValue: function() {
        var weight = parseInt($("input[type=radio]:checked").val());
        answers.push(weight);
    },
    getScore: function() {
        var j = 0,
            numberOfAnswers = answers.length;

        for (j; j < numberOfAnswers; j++) {
            score += answers[j];
        }
        return score;
    }
};

$(window).ready(function() {
    $(".question").addClass("hidden-question");
    survey.toggleQuestion(i);
    console.log("question: " + i);

    //event listener for clicking next
    $("#next-button").click(function() {
        if ($("input[type=radio]:checked").size() > 0) {
            survey.toggleQuestion(i);
            i++;
            survey.getAnswerValue();
            survey.toggleQuestion(i);
            $("input[type=radio]").prop('checked', false);
            console.log("question: " + i);
            if (i === $(".question").length) {
                survey.getScore();
                console.log(score);
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