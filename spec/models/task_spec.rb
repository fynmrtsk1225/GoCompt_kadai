# require 'rails_helper'
# describe 'タスクモデル機能', type: :model do
#   let!(:user) { FactoryBot.create(:user) }
#   describe 'バリデーションのテスト' do
#     context 'タスクのタイトルが空の場合' do
#       it 'バリデーションにひっかる' do
#         task = Task.new(
#           title: '',
#           content: 'miss_content',
#           deadline: 'miss_deadline',
#           priority: '最優先',
#           status: '未着手',
#           user_id: '0')
#         expect(task).not_to be_valid
#       end
#     end
#       context 'タスクの詳細が空の場合' do
#       it 'バリデーションにひっかかる' do
#         task = Task.new(
#           title: 'miss_title',
#           content: '',
#           deadline: 'miss_deadline',
#           priority: '最優先',
#           status: '未着手',
#           user_id: '0')
#         expect(task).not_to be_valid
#       end
#     end
#     context 'タスクのタイトルと詳細に内容が記載されている場合' do
#       it 'バリデーションが通る' do
#         task = Task.new(
#           title: 'hit_title',
#           content: 'hit_content',
#           deadline: 'hit_deadline',
#           priority: '最優先',
#           status: '未着手',
#           user_id: '0')
#         expect(task).to be_valid
#       end
#     end
#   end
#   describe '検索機能' do
#     let!(:task) { FactoryBot.create(:task, title: 'task', status: '未着手', user: user) }
#     let!(:task2) { FactoryBot.create(:task2, title: 'sample', status: '済',user: user) }
#     context 'scopeメソッドでタイトルのあいまい検索をした場合' do
#       it "検索キーワードを含むタスクが絞り込まれる" do
#         expect(Task.like_title('task')).to include(task)
#         expect(Task.like_title('task')).not_to include(task2)
#         expect(Task.like_title('task').count).to eq 1
#       end
#     end
#     context 'scopeメソッドでステータス検索をした場合' do
#       it "ステータスに完全一致するタスクが絞り込まれる" do
#         expect(Task.like_status('未着手')).to include(task)
#         expect(Task.like_status('未着手')).not_to include(task2)
#         expect(Task.like_status('未着手').count).to eq 1
#       end
#     end
#     context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
#       it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
#         expect(Task.like_title('task')).to include(task)
#         expect(Task.like_status('未着手')).to include(task)
#         expect(Task.like_title('task')).not_to include(task2)
#         expect(Task.like_status('未着手')).not_to include(task2)
#         expect(Task.like_title('task').count).to eq 1
#         expect(Task.like_status('未着手').count).to eq 1
#       end
#     end
#   end
# end

