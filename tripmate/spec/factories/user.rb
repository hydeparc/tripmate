FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    photo_path "https://seeanywhereinaday.files.wordpress.com/2014/06/roadtrip.jpg"
    sex "male"
    birthday "1990-04-01"
    nationality "Japan"
  end
end
