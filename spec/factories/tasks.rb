FactoryBot.define do
  factory :task do
    title { 'test_title1' }
    content { 'test_content' }
    deadline { '2022-07-30' }
    priority { 'test_priority' }
    status { '未着手' }
  end

  factory :task2, class: Task do
    title { 'test_title2' }
    content { 'test_content2' }
    deadline { '2022-03-07' }
    priority { 'test_priority2' }
    status { '未着手' }
  end

  factory :task3, class: Task do
    title { 'test_title1' }
    content { 'test_content3' }
    deadline { '2022-07-30' }
    priority { 'test_priority3' }
    status { '済' }
  end
end
