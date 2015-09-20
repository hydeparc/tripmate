10.times do |n|
   User.create(name: "user#{n}", email: "email#{n}@tripmate.com",
               password: "password", password_confirmation: "password",
               photo_path: "../public/profile.png", sex: 0,
               birthday: "1991-01-01", nationality: "Japan")
end
