#encoding: utf-8

task :create_parenting_styles_survey => :environment do

  # build parenting styles survey
  parenting_styles_survey = Survey::Survey.new do |survey|
    survey.name = "Mommy Styles Survey"
    survey.description = "<p>Did you know there are 16 mommy style possibilities? Find out where your blind spots are, what your strengths really are, and how you can begin to better communicate with your children and spouse.</p><p>This Mommy Style survey is based on Myer-Briggs personality types. Take the survey by answering only 4 questions. Be as accurate as possible. Be as honest to yourself as possible. Click the big green button below to begin:</p>"
    # survey.attempts_number = 3
    survey.active = true
  end

  # add Introverts vs Extroverts question and options
  question_1 = Survey::Question.new do |question|
    question.text = "Although you probably agree with some of each, which of these two descriptions sounds more like you?"
    question.options = [
      Survey::Option.new(:text => "Extraverts<split><span>Extraverted</span> mothers are energized by going, doing, interacting and experiencing. They are typically “in the know” and get children out to experience the world. Too much time isolated at home can make them feel shaky and ungrounded. They are uncomfortable with a child who is more of a loner and needs a lot of solitude.<split><h3>Extraverts often:</h3><ul><li>Have high energy</li><li>Talk more than listen</li><li>Think out loud</li><li>Act, then think</li><li>Like to be around people a lot</li><li>Prefer a public role</li><li>Can sometimes be easily distracted</li><li>Prefer to do lots of things at once</li><li>Are outgoing & enthusiastic</li></ul>", :weight => 1),
      Survey::Option.new(:text => "Introverts<split><span>Introverted</span> mothers are energized by solitude and time alone. They are observant, reflective and prefer one-on-one interactions. They know their children as individuals and provide them with “downtime” to unwind and recharge. Drained by too much interaction, they must guard their energy to make it through the day without exploding.<split><h3>Introverts often:</h3><ul><li>Have quiet energy</li><li>Listen more than talk</li><li>Think quietly inside their heads</li><li>Think, then act</li><li>Feel comfortable being alone</li><li>Prefer to work \"behind-the-scene\"</li><li>Have good powers of concentration</li><li>Prefer to focus on one thing at a time</li><li>Are self-contained and reserved</li></ul>", :weight => 2)
    ]
  end

  # add Sensors vs Intuitives question and options
  question_2 = Survey::Question.new do |question|
    question.text = "Which of the following two describes you better?"
    question.options = [
      Survey::Option.new(:text => "Sensors<split><span>Sensing</span> mothers focus on details and specifics. They attend to practicalities and the here and now. Hands-on mothers, they see to children’s basic needs and do concrete activities with them. They struggle to join in a child’s imagination or understand a child who is different. They can get stuck in a rut.<split><h3>Sensors often:</h3><ul><li>Focus on details & specifics</li><li>Admire practical solutions</li><li>Notice details & remember facts</li><li>Are pragmatic - see what is</li><li>Live in the here-and-now</li><li>Trust actual experience</li><li>Like to use established skills</li><li>Like step-by-step instructions</li><li>Work at a steady pace</li></ul>", :weight => 10),
      Survey::Option.new(:text => "Intuitives<split><span>Intuitive</span> mothers focus on the big picture and possibilities. They quickly leap from facts to patterns and themes. They encourage children’s creativity and imagination, point up options and offer them choices. Drained by the nitty-gritty, they struggle to deal with practicalities and be realistic.<split><h3>Intuitives often:</h3><ul><li>Focus on the big picture & possibilities</li><li>Admire creative ideas</li><li>Notice anything new or different</li><li>Are inventive - see what could be</li><li>Think about future implications</li><li>Trust their gut instincts</li><li>Prefer to learn new skills</li><li>Like to figure things out for themselves</li><li>Work in bursts of energy</li></ul>", :weight => 20)
    ]
  end

  # add Thinkers vs Feelers questions and options
  question_3 = Survey::Question.new do |question|
    question.text = "Which of the following two descriptions sounds more like you?"
    question.options = [
      Survey::Option.new(:text => "Thinkers<split><span>Thinking</span> mothers trust logic, objectivity and impersonal analysis. They let children do for themselves, foster independence and answer children’s why’s in order to fuel their rational development. They struggle to tune in to and be patient with children’s irrational feelings.<split><h3>Thinkers often:</h3><ul><li>Make decisions objectively</li><li>Appear cool and reserved</li><li>Are most convinced by rational arguments</li><li>Are honest and direct</li><li>Value honesty and fairness</li><li>Take few things personally</li><li>Are good at seeing flaws</li><li>Are motivated by achievement</li><li>Argue or debate issues for fun</li></ul>", :weight => 100),
      Survey::Option.new(:text => "Feelers<split><span>Feeling</span> mothers rely on values, feelings and personal information to decide. They strive to be physically and emotionally close, attuned to children’s feelings, and go to great lengths to make them happy. Seeking family harmony, they struggle to say no and be firm if it may cause conflict.<split><h3>Feelers often:</h3><ul><li>Decide based on their values & feelings</li><li>Appear warm and friendly</li><li>Are most convinced by how they feel</li><li>Are diplomatic and tactful</li><li>Value harmony and compassion</li><li>Take many things personally</li><li>Are quick to compliment others</li><li>Are motivated by appreciation</li><li>Avoid arguments and conflicts</li></ul>", :weight => 200)
    ]
  end

  # add Perceivers vs Judgers questions and options
  question_4 = Survey::Question.new do |question|
    question.text = "Which of the following two descriptions sounds more like you? And remember, there is no wrong or right answer."
    question.options = [
      Survey::Option.new(:text => "Judgers<split><span>Judging</span> mothers are intentional mothers who like structure, plans, limits, and order. They are adept at organizing day-to-day living so kids feel secure and don’t miss out. They aim to get things done, on time, and in the right way, but struggle to adapt to the unexpected, relax and have fun.<split><h3>Judgers often:</h3><ul><li>Like to have things settled</li><li>Take responsibilities seriously</li><li>Pay attention to time & are usually prompt</li><li>Prefer to finish projects</li><li>Work first, play later</li><li>Seek closure</li><li>See the need for most rules</li><li>Like to make & stick with plans</li><li>Find comfort in schedules</li></ul>", :weight => 1000),
      Survey::Option.new(:text => "Perceivers<split><span>Perceiving</span> mothers take things as they come and keep their options open. They are flexible and spontaneous, and generally tolerant and accepting of children. They enjoy hanging out and can be relaxed about clutter, but struggle to do chores regularly and keep the house in order.<split><h3>Perceivers often:</h3><ul><li>Like to keep their options open</li><li>Are playful and casual</li><li>Are less aware of time and may run late</li><li>Prefer to start projects</li><li>Play first, work later</li><li>May have difficulty making some decisions</li><li>Question the need for many rules</li><li>Like to keep plans flexible</li><li>Want the freedom to be spontaneous</li></ul>", :weight => 2000)
    ]
  end

  parenting_styles_survey.questions = [question_1, question_2, question_3, question_4]
  parenting_styles_survey.save!

end