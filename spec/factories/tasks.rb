FactoryBot.define do
  factory :task do
    id { '0' }
    title { 'test_title1' }
    content { 'test_content' }
    deadline { '2022-07-30' }
    priority { '最優先' }
    status { '未着手' }
    labels { 'MyString' }
  end

  factory :task2, class: Task do
    id { '1' }
    title { 'test_title2' }
    content { 'test_content2' }
    deadline { '2022-03-07' }
    priority { '高' }
    status { '未着手' }
    label { 'MyString' }
  end

  factory :task3, class: Task do
    id { '2' }
    title { 'test_title1' }
    content { 'test_content3' }
    deadline { '2022-07-30' }
    priority { '低' }
    status { '済' }
    label { 'MyString' }
  end
end
