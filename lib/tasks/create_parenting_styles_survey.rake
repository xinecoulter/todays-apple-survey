#encoding: utf-8

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
    question.text = "Although you probably agree with some of each, which of these two descriptions sounds more like you? (Check Only One)<new-paragraph>Extraverted parents are energized by going, doing, interacting and experiencing. They are typically “in the know” and get children out to experience the world. Too much time isolated at home can make them feel shaky and ungrounded. They are uncomfortable with a child who is more of a loner and needs a lot of solitude.<new-paragraph>Introverted parents are energized by solitude and time alone. They are observant, reflective and prefer one-on-one interactions. They know their children as individuals and provide them with “downtime” to unwind and recharge. Drained by too much interaction, they must guard their energy to make it through the day without exploding.<new-paragraph>If you are still unsure here are more detailed descriptions of Extraverts vs Introverts"
    question.options = [
      Survey::Option.new(:text => "Extraverted – Yes, that's more like me", :weight => 1),
      Survey::Option.new(:text => "Introverted – Yes, this sound like me",  :weight => 2)
    ]
  end

  # add Sensors vs Intuitives question and options
  question_2 = Survey::Question.new do |question|
    question.text = "Which of the following two describes you better?<new-paragraph>Sensing parents focus on details and specifics. They attend to practicalities and the here and now. Hands-on parents, they see to children’s basic needs and do concrete activities with them. They struggle to join in a child’s imagination or understand a child who is different. They can get stuck in a rut.<new-paragraph>Intuitive parents focus on the big picture and possibilities. They quickly leap from facts to patterns and themes. They encourage children’s creativity and imagination, point up options and offer them choices. Drained by the nitty-gritty, they struggle to deal with practicalities and be realistic.<new-paragraph>If you are still unsure here are more detailed descriptions of Sensors vs Intuitives"
    question.options = [
      Survey::Option.new(:text => "Sensing – Yes, this sound like me", :weight => 10),
      Survey::Option.new(:text => "Intuitive – Yes, that's more like me", :weight => 20),
    ]
  end

  # add Thinkers vs Feelers questions and options
  question_3 = Survey::Question.new do |question|
    question.text = "Which of the following two descriptions sounds more like you?<new-paragraph>Thinking parents trust logic, objectivity and impersonal analysis. They let children do for themselves, foster independence and answer children’s why’s in order to fuel their rational development. They struggle to tune in to and be patient with children’s irrational feelings.<new-paragraph>Feeling parents rely on values, feelings and personal information to decide. They strive to be physically and emotionally close, attuned to children’s feelings, and go to great lengths to make them happy. Seeking family harmony, they struggle to say no and be firm if it may cause conflict.<new-paragraph>If you are still unsure here are more detailed descriptions of Thinkers vs Feelers"
    question.options = [
      Survey::Option.new(:text => "Thinking – Yes, this sound like me", :weight => 100),
      Survey::Option.new(:text => "Feeling – Yes, this feels more like me", :weight => 200),
    ]
  end

  # add Perceivers vs Judgers questions and options
  question_4 = Survey::Question.new do |question|
    question.text = "Which of the following two descriptions sounds more like you? And remember, there is no wrong or right answer.<new-paragraph>Judging parents are intentional parents who like structure, plans, limits, and order. They are adept at organizing day-to-day living so kids feel secure and don’t miss out. They aim to get things done, on time, and in the right way, but struggle to adapt to the unexpected, relax and have fun.<new-paragraph>Perceiving parents take things as they come and keep their options open. They are flexible and spontaneous, and generally tolerant and accepting of children. They enjoy hanging out and can be relaxed about clutter, but struggle to do chores regularly and keep the house in order.<new-paragraph>If you are still unsure here are more detailed descriptions of Judgers vs Perceivers"
    question.options = [
      Survey::Option.new(:text => "Judging – Yes, this sound like me", :weight => 1000),
      Survey::Option.new(:text => "Perceiving – Yes, this seems like me", :weight => 2000)
    ]
  end

  parenting_styles_survey.questions = [question_1, question_2, question_3, question_4]
  parenting_styles_survey.save!

end