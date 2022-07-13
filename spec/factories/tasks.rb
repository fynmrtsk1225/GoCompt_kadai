FactoryBot.define do
  factory :task do
    title { 'test_title1' }
    content { 'test_content' }
    deadline { '2022-07-30' }
    priority { '最優先' }
    status { '未着手' }
  end

  factory :task2, class: Task do
    title { 'test_title2' }
    content { 'test_content2' }
    deadline { '2022-03-07' }
    priority { '高' }
    status { '未着手' }
  end

  factory :task3, class: Task do
    title { 'test_title1' }
    content { 'test_content3' }
    deadline { '2022-07-30' }
    priority { '低' }
    status { '済' }
  end
end
