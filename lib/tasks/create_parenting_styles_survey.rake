#encoding: utf-8

task :create_parenting_styles_survey => :environment do

  # build parenting styles survey
  parenting_styles_survey = Survey::Survey.new do |survey|
    survey.name = "Parenting Styles Survey"
    survey.description = "<p>Did you know there are 16 parenting style possibilities? Find out where your blind spots are, what your strengths really are, and how you can begin to better communicate with your children and spouse.</p><p>This Parenting Style survey is based on Myer-Briggs personality types. Take the survey by answering only 4 questions. Be as accurate as possible. Be as honest to yourself as possible. Click the big green button below to begin:</p>"
    # survey.attempts_number = 3
    survey.active = true
  end

  # add Introverts vs Extroverts question and options
  question_1 = Survey::Question.new do |question|
    question.text = "<p>Although you probably agree with some of each, which of these two descriptions sounds more like you? (Check Only One)</p><p><span>Extraverted</span> parents are energized by going, doing, interacting and experiencing. They are typically “in the know” and get children out to experience the world. Too much time isolated at home can make them feel shaky and ungrounded. They are uncomfortable with a child who is more of a loner and needs a lot of solitude.</p><p><span>Introverted</span> parents are energized by solitude and time alone. They are observant, reflective and prefer one-on-one interactions. They know their children as individuals and provide them with “downtime” to unwind and recharge. Drained by too much interaction, they must guard their energy to make it through the day without exploding.</p><p>If you are still unsure here are more detailed descriptions of <button>Extraverts vs Introverts"
    question.first_detailed_description = "<h4>Extraverts often:</h4><ul><li><p>Have high energy</p></li><li><p>Talk more than listen</p></li><li><p>Think out loud</p></li><li><p>Act, then think</p></li><li><p>Like to be around people a lot</p></li><li><p>Prefer a public role</p></li><li><p>Can sometimes be easily distracted</p></li><li><p>Prefer to do lots of things at once</p></li><li><p>Are outgoing & enthusiastic</p></li></ul>"
    question.second_detailed_description = "<h4>Introverts often:</h4><ul><li><p>Have quiet energy</p></li><li><p>Listen more than talk</p></li><li><p>Think quietly inside their heads</p></li><li><p>Think, then act</p></li><li><p>Feel comfortable being alone</p></li><li><p>Prefer to work \"behind-the-scene\"</p></li><li><p>Have good powers of concentration</p></li><li><p>Prefer to focus on one thing at a time</p></li><li><p>Are self-contained and reserved</p></li></ul>"
    question.options = [
      Survey::Option.new(:text => "Extraverted – Yes, that's more like me", :weight => 1),
      Survey::Option.new(:text => "Introverted – Yes, this sound like me",  :weight => 2)
    ]
  end

  # add Sensors vs Intuitives question and options
  question_2 = Survey::Question.new do |question|
    question.text = "<p>Which of the following two describes you better?</p><p><span>Sensing</span> parents focus on details and specifics. They attend to practicalities and the here and now. Hands-on parents, they see to children’s basic needs and do concrete activities with them. They struggle to join in a child’s imagination or understand a child who is different. They can get stuck in a rut.</p><p><span>Intuitive</span> parents focus on the big picture and possibilities. They quickly leap from facts to patterns and themes. They encourage children’s creativity and imagination, point up options and offer them choices. Drained by the nitty-gritty, they struggle to deal with practicalities and be realistic.</p><p>If you are still unsure here are more detailed descriptions of <button>Sensors vs Intuitives"
    question.first_detailed_description = "<h4>Sensors often:</h4><ul><li><p>Focus on details & specifics</p></li><li><p>Admire practical solutions</p></li><li><p>Notice details & remember facts</p></li><li><p>Are pragmatic - see what is</p></li><li><p>Live in the here-and-now</p></li><li><p>Trust actual experience</p></li><li><p>Like to use established skills</p></li><li><p>Like step-by-step instructions</p></li><li><p>Work at a steady pace</p></li></ul>"
    question.second_detailed_description = "<h4>Intuitives often:</h4><ul><li><p>Focus on the big picture & possibilities</p></li><li><p>Admire creative ideas</p></li><li><p>Notice anything new or different</p></li><li><p>Are inventive - see what could be</p></li><li><p>Think about future implications</p></li><li><p>Trust their gut instincts</p></li><li><p>Prefer to learn new skills</p></li><li><p>Like to figure things out for themselves</p></li><li><p>Work in bursts of energy</p></li></ul>"
    question.options = [
      Survey::Option.new(:text => "Sensing – Yes, this sound like me", :weight => 10),
      Survey::Option.new(:text => "Intuitive – Yes, that's more like me", :weight => 20),
    ]
  end

  # add Thinkers vs Feelers questions and options
  question_3 = Survey::Question.new do |question|
    question.text = "<p>Which of the following two descriptions sounds more like you?</p><p><span>Thinking</span> parents trust logic, objectivity and impersonal analysis. They let children do for themselves, foster independence and answer children’s why’s in order to fuel their rational development. They struggle to tune in to and be patient with children’s irrational feelings.</p><p><span>Feeling</span> parents rely on values, feelings and personal information to decide. They strive to be physically and emotionally close, attuned to children’s feelings, and go to great lengths to make them happy. Seeking family harmony, they struggle to say no and be firm if it may cause conflict.</p><p>If you are still unsure here are more detailed descriptions of <button>Thinkers vs Feelers"
    question.first_detailed_description = "<h4>Thinkers often:</h4><ul><li><p>Make decisions objectively</p></li><li><p>Appear cool and reserved</p></li><li><p>Are most convinced by rational arguments</p></li><li><p>Are honest and direct</p></li><li><p>Value honesty and fairness</p></li><li><p>Take few things personally</p></li><li><p>Are good at seeing flaws</p></li><li><p>Are motivated by achievement</p></li><li><p>Argue or debate issues for fun</p></li></ul>"
    question.second_detailed_description = "<h4>Feelers often:</h4><ul><li><p>Decide based on their values & feelings</p></li><li><p>Appear warm and friendly</p></li><li><p>Are most convinced by how they feel</p></li><li><p>Are diplomatic and tactful</p></li><li><p>Value harmony and compassion</p></li><li><p>Take many things personally</p></li><li><p>Are quick to compliment others</p></li><li><p>Are motivated by appreciation</p></li><li><p>Avoid arguments and conflicts</p></li></ul>"
    question.options = [
      Survey::Option.new(:text => "Thinking – Yes, this sound like me", :weight => 100),
      Survey::Option.new(:text => "Feeling – Yes, this feels more like me", :weight => 200),
    ]
  end

  # add Perceivers vs Judgers questions and options
  question_4 = Survey::Question.new do |question|
    question.text = "<p>Which of the following two descriptions sounds more like you? And remember, there is no wrong or right answer.</p><p><span>Judging</span> parents are intentional parents who like structure, plans, limits, and order. They are adept at organizing day-to-day living so kids feel secure and don’t miss out. They aim to get things done, on time, and in the right way, but struggle to adapt to the unexpected, relax and have fun.</p><p><span>Perceiving</span> parents take things as they come and keep their options open. They are flexible and spontaneous, and generally tolerant and accepting of children. They enjoy hanging out and can be relaxed about clutter, but struggle to do chores regularly and keep the house in order.</p><p>If you are still unsure here are more detailed descriptions of <button>Judgers vs Perceivers"
    question.first_detailed_description = "<h4>Judgers often:</h4><ul><li><p>Like to have things settled</p></li><li><p>Take responsibilities seriously</p></li><li><p>Pay attention to time & are usually prompt</p></li><li><p>Prefer to finish projects</p></li><li><p>Work first, play later</p></li><li><p>Seek closure</p></li><li><p>See the need for most rules</p></li><li><p>Like to make & stick with plans</p></li><li><p>Find comfort in schedules</p></li></ul>"
    question.second_detailed_description = "<h4>Perceivers often:</h4><ul><li><p>Like to keep their options open</p></li><li><p>Are playful and casual</p></li><li><p>Are less aware of time and may run late</p></li><li><p>Prefer to start projects</p></li><li><p>Play first, work later</p></li><li><p>May have difficulty making some decisions</p></li><li><p>Question the need for many rules</p></li><li><p>Like to keep plans flexible</p></li><li><p>Want the freedom to be spontaneous</p></li></ul>"
    question.options = [
      Survey::Option.new(:text => "Judging – Yes, this sound like me", :weight => 1000),
      Survey::Option.new(:text => "Perceiving – Yes, this seems like me", :weight => 2000)
    ]
  end

  parenting_styles_survey.questions = [question_1, question_2, question_3, question_4]
  parenting_styles_survey.save!

end