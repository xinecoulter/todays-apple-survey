task :create_parenting_styles_survey => :environment do

  # build parenting styles survey
  parenting_styles_survey = Survey::Survey.new do |survey|
    survey.name = "Parenting Styles Survey"
    survey.description = "Survey description blah blah blah"
    # survey.attempts_number = 3
    survey.active = true
  end

  # add Introverts vs Extroverts question and options
  question_1 = Survey::Question.new do |question|
    question.text = "1. Although you probably agree with some of each, which of these two descriptions sounds more like you? (Check Only One)"
    question.options = [
      Survey::Option.new(:text => "Introverted – Yes, this sound like me",  :weight => 2),
      Survey::Option.new(:text => "Extroverted – Yes, that's more like me", :weight => 1)
    ]
  end

  # add Sensors vs Intuitives question and options
  question_2 = Survey::Question.new do |question|
    question.text = "2. Which of the following two describes you better?"
    question.options = [
      Survey::Option.new(:text => "Sensing – Yes, this sound like me", :weight => 10),
      Survey::Option.new(:text => "Intuitive – Yes, that's more like me", :weight => 20),
    ]
  end

  # add Thinkers vs Feelers questions and options
  question_3 = Survey::Question.new do |question|
    question.text = "3. Which of the following two descriptions sounds more like you?"
    question.options = [
      Survey::Option.new(:text => "Thinking – Yes, this sound like me", :weight => 100),
      Survey::Option.new(:text => "Feeling – Yes, this feels more like me", :weight => 200),
    ]
  end

  # add Perceivers vs Judgers questions and options
  question_4 = Survey::Question.new do |question|
    question.text = "4. Which of the following two descriptions sounds more like you? And remember, there is no wrong or right answer."
    question.options = [
      Survey::Option.new(:text => "Perceiving – Yes, this seems like me", :weight => 2000),
      Survey::Option.new(:text => "Judging – Yes, this sound like me", :weight => 1000),
    ]
  end

  parenting_styles_survey.questions = [question_1, question_2, question_3, question_4]
  parenting_styles_survey.save!

end