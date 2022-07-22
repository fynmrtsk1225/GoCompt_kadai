# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {id: 0, name: 'Aono', email: 'aono@exam.com', password: 'aonoaono', password_confirmation: 'aonoaono', admin: true},
  {id: 1, name: 'Endo', email: 'endo@exam.com', password: 'endoendo', password_confirmation: 'endoendo'},
  {id: 2, name: 'Kadowaki', email: 'kadowaki@exam.com', password: 'kadowakikadowaki', password_confirmation: 'kadowakikadowaki'},
  {id: 3, name: 'Kaneko', email: 'kaneko@exam.com', password: 'kanekokaneko', password_confirmation: 'kanekokaneko'},
  {id: 4, name: 'Saito', email: 'saito@exam.com', password: 'saitosaito', password_confirmation: 'saitosaito'},
  {id: 5, name: 'Sato', email: 'sato@exam.com', password: 'satosato', password_confirmation: 'satosato'},
  {id: 6, name: 'Nakamura', email: 'nakamura@exam.com', password: 'nakamuranakamura', password_confirmation: 'nakamuranakamura'},
  {id: 7, name: 'Suzuki', email: 'suzuki@exam.com', password: 'suzukisuzuki', password_confirmation: 'suzukisuzuki'},
  {id: 8, name: 'Maruoka', email: 'maruoka@exam.com', password: 'maruokamaruoka', password_confirmation: 'maruokamaruoka'},
  {id: 9, name: 'Nishikawa', email: 'nishikawa@exam.com', password: 'nishikawanishikawa', password_confirmation: 'nishikawanishikawa'},
  {id: 10, name: 'Yoshida', email: 'yoshida@exam.com', password: 'yoshidayoshida', password_confirmation: 'yoshidayoshida'},
  {id: 11, name: 'Yamada', email: 'yamada@exam.com', password: 'yamadayamada', password_confirmation: 'yamadayamada'},
  {id: 12, name: 'Moritsuka', email: 'moritsuka@exam.com', password: 'moritsukamoritsuka', password_confirmation: 'moritsukamoritsuka'}
  ])

  15.times do |i|
    Label.create!(name: "label#{i + 1}")
  end

  15.times do |i|
    Task.create!(user_id: '0', title: "sample#{i + 1}", content: "sample#{i + 1}", deadline: '2058-03-07', priority: '高', status: '未着手', label_ids: "#{i + 1}" )
  end