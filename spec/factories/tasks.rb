FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    deadline { 'test_deadline' }
    priority { 'test_priority' }
    status { 'test_status' }
  end

  factory :task2 do
    title { 'test_title2' }
    content { 'test_content2' }
    deadline { 'test_deadline2' }
    priority { 'test_priority2' }
    status { 'test_status2' }
  end
end
