var i = 0;

var survey = {
  showQuestion: function(index) {
    $(".question:eq("+index+")").toggleClass("visible-question");
  },
  getWeightValue: function() {
  }
};

$(window).ready(function() {
  $(".question").addClass("hidden-question");
  survey.showQuestion(i);
});

// $("input[type=radio]:checked")

// $('#view_selection_donut a').click(function() {
//         var view_type = $(this).attr('id');
//         $('#view_selection_donut a').removeClass('active');
//         $(this).toggleClass('active');
//         toggle_view(view_type);
//         return false;
//     });