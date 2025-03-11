@user = User.create!(email: 'admin@admin', password: Faker::Internet.password(min_length: 8))

users = []
50.times do
  users << User.create!(email: Faker::Internet.unique.email, password: Faker::Internet.password(min_length: 8))
end

15.times do
  @article = @user.articles.create!(title: Faker::Book.title, body: Faker::Lorem.paragraph_by_chars(number: 300))

  rand(1..50).times do
    user = users.sample
    ArticleLike.create!(article: @article, user: user) unless ArticleLike.exists?(article: @article, user: user)
  end
end