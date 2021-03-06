//variables to keep track of which number question the user is on, their answers, and the total score (sum of weight of answers)
var i = 0,
  answers = [],
  score = 0;

//16 different parenting style outcomes based on score
//1 of the values will be sent as a parameter in the redirect to the registration page
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
  beginSurvey: function () {
    $("#start-button").addClass("hidden");
    $("#survey-description").addClass("hidden");
    $("#questions-panel").slideDown("slow");
    $(".barBg").removeClass("hidden");
  },
  toggleQuestion: function (index) {
    //shows/hides question by index of questions array
    setTimeout(function () {
      $("#question-number").text("Question: " + String(i + 1) + "/" + String($(".question").length));
      $(".question:eq(" + index + ")").toggleClass("visible-question");
    }, 1000);
  },
  getAnswerValue: function () {
    //retrieves value associated with radio button
    var weight = parseInt($("input[type=radio]:checked").val());
    answers.push(weight);
  },
  getScore: function () {
    //calculates sum of values associated with all answers
    var j = 0,
        numberOfAnswers = answers.length;

    for (j; j < numberOfAnswers; j++) {
      score += answers[j];
    }
    return score;
  },
  getResults: function (score) {
    //determines results based on score and calls redirectToSubscription after 1.5seconds (enough time to finish progress animation)
    console.log("Your parenting style is: " + results[String(score)]);
    $("#progress").removeClass();
    setTimeout(function () {
      survey.redirectToSubscription();
    }, 1500);
  },
  redirectToSubscription: function () {
    //redirects to todaysapple subscription page
    window.location = "http://todaysapple.com/parenting-style-2/?parentingstyle=" + results[String(score)];
  },
  increaseProgressBar: function (index) {
    var increment = (100 / $(".question").length);
    $(".bar").animate({
      width: String(increment * index) + "%"
    }, 400, "linear", survey.toggleQuestion(index));
  }
};

$(window).ready(function () {
  $(".question").addClass("hidden-question");
  $(".description-div").addClass("hidden");
  $(".warning").addClass("hidden");
  survey.toggleQuestion(i);

  //event listeners for beginning the survey
  //event listener for clicking the start button
  $("#start-button").click(function () {
    survey.beginSurvey();
  });
  //event listener for clicking on the family image for people who don't know how to click on the start button
  $(".family-pic-div img").click(function () {
    survey.beginSurvey();
  });
  //event listener for clicking on the headline for people who don't know how to click on the start button
  $("#title").click(function () {
    survey.beginSurvey();
  });
  //event listener for clicking on the logo for people who don't know how to click on the start button
  $(".subheading").click(function () {
    survey.beginSurvey();
  });

  //event listener for selecting radiowrapper div
  //sets all radiowrapper divs to light gray and makes radiowrapper of selected input mint green
  $(".radiowrapper").click(function (e) {
    $(".warning").addClass("hidden"); //hides warning if user selects answer

    //resets all radiowrappers to have a light gray background color and a white border
    $(".radiowrapper").css("background-color", "rgb(245, 245, 245)");
    $(".radiowrapper").css("border-color", "#ffffff");

    //changes background color or selected radiowrapper to mint green and changes border to dark green
    $(this).css("background-color", "rgb(182, 238, 182)");
    $(this).css("border-color", "rgb(63, 143, 63)");

    //makes sure invisible radio button inside selected div is actually checked
    $(this).find("input[type=radio]").prop("checked", true);

  });

  //event listeners for hovering over radiowrapper div
  //sets radiowrapper to light green when the mouse enters, if it is not the parent radiowrapper div of the checked input
  $(".radiowrapper").mouseenter(function () {
    if ( $(window).width() >= 800) {
      if ($(this).css("background-color") !== "rgb(182, 238, 182)") {
        $(this).css("background-color", "rgb(231, 255, 231)");
      }
    }
  });
  //sets radiowrapper to light gray when the mouse leaves, if it is not the parent radiowrapper div of the checked input
  $(".radiowrapper").mouseleave(function () {
    if ( $(window).width() >= 800) {
      if ($(this).css("background-color") !== "rgb(182, 238, 182)") {
        $(this).css("background-color", "rgb(245, 245, 245)");
      }
    }
  });

  //event listener for clicking on description buttons
  $(".description-button").click(function (event) {
    event.preventDefault();
    event.stopPropagation(); //stops parent radiowrapper's radiobutton from being selected when clicking on the description button
    $(".description-button").addClass("hidden");
    $(".description-div").removeClass("hidden");
  });

  //event listener for clicking next
  $("#next-button").click(function () {
    if ($("input[type=radio]:checked").size() > 0) {

      $(".description-button").removeClass("hidden");
      $(".description-div").addClass("hidden");

      survey.toggleQuestion(i);
      i++;
      survey.getAnswerValue();
      survey.increaseProgressBar(i);
      $("input[type=radio]").prop('checked', false);
      if (i === $(".question").length) {
        $("#next-button").remove();
        $("#question-number").addClass("hidden");
        $(".question").remove();
        $("#survey-content").css("height", "100%");
        survey.getScore();
        console.log(answers);
        console.log(score);
        survey.getResults(score);
      }
    } else {
      $(".warning").removeClass("hidden"); //displays warning to select an answer
    }
  });
});