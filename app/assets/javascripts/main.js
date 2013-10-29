var i = 0;

var survey = {
    toggleQuestion: function(index) {
        $(".question:eq("+index+")").toggleClass("visible-question");
    },
    getWeightValue: function() {
    },
    disableBackButton: function() {
        // if (i === 0) {

        // }
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
            survey.toggleQuestion(i);
            $("input[type=radio]").prop('checked', false);
        }
    });

    //event listener for clicking back
    $("#back-button").click(function() {
        if (i > 0) {
            survey.toggleQuestion(i);
            i--;
            survey.toggleQuestion(i);
        }
    });
});

// $("input[type=radio]:checked")

// $("input[type=radio]").prop('checked', false);

// $('#view_selection_donut a').click(function() {
//         var view_type = $(this).attr('id');
//         $('#view_selection_donut a').removeClass('active');
//         $(this).toggleClass('active');
//         toggle_view(view_type);
//         return false;
//     });