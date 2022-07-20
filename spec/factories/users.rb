FactoryBot.define do
  factory :user do
    id {'0'}
    name { 'test1' }
    email { 'test1@test.com' }
    password { 'test_1' }
    admin { 'true' }
  end

  factory :user2, class: User do
    id {'1'}
    name { 'test2' }
    email { 'test2@test.com' }
    password { 'test_2' }
    admin { 'false' }
  end
end
