FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    deadline { 'test_deadline' }
    priority { 'test_priority' }
    status { 'test_status' }
  end
end
