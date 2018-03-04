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
  name: 'American Red Cross'
)

Presenter.create!(
  name: 'Habitat for Humanity'
)

Presenter.create!(
  name: 'Teach for America'
)

Presenter.create!(
  name: 'Planned Parenthood'
)

Presenter.create!(
  name: 'American Cancer Society'
)

User.create!(
  name: 'Mike',
  password: 'password'
)

User.create!(
  name: 'John',
  password: 'password'
)

User.create!(
  name: 'Jill',
  password: 'password'
)

User.create(
  name: 'Kim',
  password: 'password'
)

User.create(
  name: 'Robert',
  password: 'password'
)
scores = [1,2,3,4,5]
questions =[1,2,3,4,5,6]

40.times do
  Score.create(
    question_id: questions.sample,
    points: scores.sample,
    user_id: scores.sample,
    presenter_id: scores.sample
  )
end
