Question.create!(
  content:'Clearly articulated the need, approach and competitive advantage'
)

Question.create!(
  content:'Engaged you as a potential supporter and left you wanting to know more'
)

Question.create!(
  content:'Clearly communicated impact'
)

Question.create!(
  content:'Clear ask'
)

Question.create!(
  content:'Presentation style'
)

Question.create!(
  content:'Inspiration factor'
)

Presenter.create!(
  name: 'Center for Advancing Domestic Peace'
)

Presenter.create!(
  name: 'CircEsteem'
)

Presenter.create!(
  name: 'CodeNow'
)

Presenter.create!(
  name: 'Common Threads'
)

Presenter.create!(
  name: 'Cradles to Crayons'
)

Presenter.create!(
  name: 'HFS Chicago Scholars'
)

Presenter.create!(
  name: 'Ladies of Virtue'
)

Presenter.create!(
  name: 'LEAP (Language Empowers All People)'
)

Presenter.create!(
  name: 'MAPSCorps'
)

Presenter.create!(
  name: 'New Moms'
)

Presenter.create!(
  name: "Sarah's Circle"
)

Presenter.create!(
  name: 'Thrive Chicago'
)

Presenter.create!(
  name: 'UpWorld'
)

Presenter.create!(
  name: 'About Face Theatre'
)

Presenter.create!(
  name: 'Project Exploration'
)

# user1=User.create!(
#   first_name: 'Leif',
#   surname:'Nesse',
#   username:'Leif',
#   password: 'password'
# )

# presenters = Presenter.all

# presenters.each do |presenter|
#   Rank.create!(
#     user_id: user1.id,
#     presenter_id: presenter.id,
#     scored: false
# )

# end
# user2=User.create!(
#   first_name: 'John',
#   surname: 'Johnoson',
#   username: 'John',
#   password: 'password'
# )
#
# presenters.each do |presenter|
#   Rank.create!(
#     user_id: user2.id,
#     presenter_id: presenter.id,
#     scored: false
# )
# end
#
#
# user3=User.create!(
#   first_name: 'Jill',
#   surname:'Jillson',
#   username: 'Jill',
#   password: 'password'
# )
#
# presenters.each do |presenter|
#   Rank.create!(
#     user_id: user3.id,
#     presenter_id: presenter.id,
#     scored: false
# )
# end
#
# user4=User.create(
#   first_name: 'Kim',
#   surname:'Kimson',
#   username:'Kim',
#   password: 'password'
# )
#
# presenters.each do |presenter|
#   Rank.create!(
#     user_id: user4.id,
#     presenter_id: presenter.id,
#     scored: false
# )
# end
#
# user5=User.create(
#   first_name: 'Robert',
#   surname:'Robertson',
#   username:'Robert',
#   password: 'password'
# )
#
# presenters.each do |presenter|
#   Rank.create!(
#     user_id: user5.id,
#     presenter_id: presenter.id,
#     scored: false
# )
# end
#
# scores = [1,2,3,4,5]
#
# users = User.all
#
# presenters.each do |presenter|
#   users.each do |user|
#     FinalRank.create(
#       presenter_id: presenter.id,
#       user_id: user.id,
#       final_rank: scores.sample
#     )
#   end
# end
#
#
# questions =[1,2,3,4,5,6]
#
# 40.times do
#   Score.create(
#     question_id: questions.sample,
#     points: scores.sample,
#     user_id: scores.sample,
#     presenter_id: scores.sample
#   )
# end
