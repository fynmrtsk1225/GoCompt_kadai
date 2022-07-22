require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:label) { FactoryBot.create(:label) }
  let!(:label2) { FactoryBot.create(:label2) }
  before do
    visit new_session_path
    fill_in 'session_email', with: 'test1@test.com'
    fill_in 'session_password', with: 'test_1'
    click_on 'Log in'
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '複数のラベルを登録できる' do
        visit new_task_path
        fill_in 'task_title', with: 'test_title'
        fill_in 'task_content', with: 'test_content'
        have_select Date.today, from: 'Deadline'
        select '最優先', from: 'task_priority'
        select '未着手', from: 'task_status'
        check 'MyString'
        check 'MyString2'
        click_on '登録する'
        expect(page).to have_content 'test'
      end
    end
  end
  describe '投稿表示機能' do
    before do
      visit new_task_path
      fill_in 'task_title', with: 'test_title'
      fill_in 'task_content', with: 'test_content'
      have_select Date.today, from: 'Deadline'
      select '最優先', from: 'task_priority'
      select '未着手', from: 'task_status'
      check 'MyString'
      check 'MyString2'
      click_on '登録する'
      visit tasks_path
    end
    context '詳細画面に遷移した場合' do
      it '登録したラベルを確認できる' do
        click_on 'Show'
        expect(page).to have_content 'MyString'
      end
    end
    context '一覧画面に遷移した場合' do
      it 'ラベルで検索できる' do
        select 'MyString', from: 'label_id'
        click_on 'Search'
        expect(page).to have_content 'test'
      end
    end
  end
end
