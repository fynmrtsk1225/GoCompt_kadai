# require 'rails_helper'
# RSpec.describe 'タスク管理機能', type: :system do
#   let!(:user) { FactoryBot.create(:user) }
#   before do
#     visit new_session_path
#     fill_in 'session_email', with: 'test1@test.com'
#     fill_in 'session_password', with: 'test_1'
#     click_on 'Log in'
#   end
#   describe '新規作成機能' do
#     context 'タスクを新規作成した場合' do
#       it '作成したタスクが表示される' do
#         visit new_task_path
#         fill_in 'task_title', with: 'test_title'
#         fill_in 'task_content', with: 'test_content'
#         have_select Date.today, from: 'Deadline'
#         select '最優先', from: 'task_priority'
#         select '未着手', from: 'task_status'
#         click_on '登録する'
#         expect(page).to have_content 'test'
#       end
#     end
#   end
#   describe '一覧表示機能' do
#     let!(:task) { FactoryBot.create(:task, user: user) }
#     let!(:task2) { FactoryBot.create(:task2, user: user) }
#     context '一覧画面に遷移した場合' do
#       it '作成済みのタスク一覧が表示される' do
#         visit tasks_path
#         expect(page).to have_content 'test'
#       end
#     end
#     context 'タスクが作成日時の降順に並んでいる場合' do
#       it '新しいタスクが一番上に表示される' do
#         visit tasks_path
#         task = all('tbody tr')
#         task_0 = task[0]
#         expect(task_0).to have_content "2"
#       end
#     end
#     context 'Deadlineを押した時終了期限順の降順で並んでいる場合' do
#       it '終了期限の遅いものが一番上に表示される' do
#         visit tasks_path
#         click_on 'Deadline'
#         sleep(0.5)
#         task = all('tbody tr')
#         task_0 = task[0]
#         expect(task_0).to have_content "2022-07-30"
#       end
#     end
#     context 'Priorityを押した時優先順位の降順で並んでいる場合' do
#       it '優先度の高いものが一番上に表示される' do
#         visit tasks_path
#         click_on 'Priority'
#         sleep(0.5)
#         task = all('tbody tr')
#         task_0 = task[0]
#         expect(task_0).to have_content "最優先"
#       end
#     end
#   end
#   describe '検索機能' do
#     let!(:task) { FactoryBot.create(:task, title: 'title1', user: user) }
#     let!(:task2) { FactoryBot.create(:task2, title: 'title2', user: user) }
#     let!(:task3) { FactoryBot.create(:task3, title: 'title1', user: user) }
#     context '検索をした場合' do 
#       it 'タイトルで検索できる' do
#         visit tasks_path
#         fill_in 'title', with: 'title1'
#         click_on 'Search'
#         expect(page).to have_content 'title1'
#       end
#       it 'ステータスで検索できる' do
#         visit tasks_path
#         select '未着手', from: 'status'
#         click_on 'Search'
#         expect(page).to have_content '未着手'
#       end
#       it 'タイトルとステータスの両方で検索できる' do
#         visit tasks_path
#         fill_in 'title', with: 'title1'
#         select '済', from: 'status'
#         click_on 'Search'
#         expect(page).to have_content 'content3'
#       end
#     end
#   end
#   describe '詳細表示機能' do
#     context '任意のタスク詳細画面に遷移した場合' do
#       it '該当タスクの内容が表示される' do
#         task = FactoryBot.create(:task, user: user)
#         visit tasks_path
#         click_link 'Show'
#         expect(page).to have_content 'test'
#       end
#     end
#   end
# end
