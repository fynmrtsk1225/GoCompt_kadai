FactoryBot.define do
  factory :label do
    name { "MyString" }
  end

  factory :label2, class: Label do
    name { "MyString2" }
  end
end
