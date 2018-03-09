json.array! @presenters.each do |presenter|
  json.id presenter.id
  json.name presenter.name
end
