require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_title', with: 'test_title'
        fill_in 'task_content', with: 'test_content'
        have_select Date.today, from: 'Deadline'
        select '最優先', from: 'task_priority'
        select '未着手', from: 'task_status'
        click_on '登録する'
        expect(page).to have_content 'test'
      end
    end
  end
  describe '一覧表示機能' do
    let!(:task) { FactoryBot.create(:task, title: 'task') }
    let!(:task2) { FactoryBot.create(:task, title: 'task2') }
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task = all('tbody tr')
        task_0 = task[0]
        expect(task_0).to have_content "2"
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        click_link 'Show'
        expect(page).to have_content 'test'
      end
    end
  end
end
