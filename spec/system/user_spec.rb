require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe 'ユーザ登録機能' do
    context 'ユーザを新規登録した場合' do
      it '作成したユーザのタスク一覧が表示される' do
        visit new_user_path
        fill_in 'user_name', with: 'test1'
        fill_in 'user_email', with: 'test1@test.com'
        fill_in 'user_password', with: 'test_1'
        fill_in 'user_password_confirmation', with: 'test_1'
        click_on 'Create my account'
        expect(page).to have_content 'test1'
      end
    end
    context '未ログインでタスク一覧画面に飛んだ場合' do
      it 'ログイン画面に遷移する' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end
  describe 'セッション機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user2) }
    context 'ログインした場合' do
      it 'ログインができる' do
        visit new_session_path
        fill_in 'session_email', with: 'test1@test.com'
        fill_in 'session_password', with: 'test_1'
        click_on 'Log in'
        expect(page).to have_content 'test1'
      end
      it '自分の詳細画面に遷移する' do
        visit new_session_path
        fill_in 'session_email', with: 'test1@test.com'
        fill_in 'session_password', with: 'test_1'
        click_on 'Log in'
        expect(current_path).to eq user_path(0)
      end
      it '他人の詳細画面に遷移できない' do
        visit new_session_path
        fill_in 'session_email', with: 'test2@test.com'
        fill_in 'session_password', with: 'test_2'
        click_on 'Log in'
        visit user_path(0)
        expect(current_path).to eq tasks_path
      end
      it 'ログアウトできる' do
        visit new_session_path
        fill_in 'session_email', with: 'test2@test.com'
        fill_in 'session_password', with: 'test_2'
        click_on 'Log in'
        click_link 'Logout'
        expect(current_path).to eq new_session_path
      end
    end
  end
  describe '管理画面機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user2) }
    context '一般ユーザでログインした場合' do
      it '管理画面にアクセスできない' do
        visit new_session_path
        fill_in 'session_email', with: 'test2@test.com'
        fill_in 'session_password', with: 'test_2'
        click_on 'Log in'
        visit admin_users_path
        expect(current_path).to eq tasks_path
      end
    end
    context '管理者でログインした場合' do
      before do
        visit new_session_path
        fill_in 'session_email', with: 'test1@test.com'
        fill_in 'session_password', with: 'test_1'
        click_on 'Log in'
        click_link 'Management'
      end
      it '管理画面にアクセスできる' do
        expect(current_path).to eq admin_users_path
      end
      it 'ユーザの新規登録ができる' do
        click_link 'New User'
        fill_in 'user_name', with: 'test3'
        fill_in 'user_email', with: 'test3@test.com'
        fill_in 'user_password', with: 'test_3'
        fill_in 'user_password_confirmation', with: 'test_3'
        click_on 'Create my account'
        expect(page).to have_content 'test3'
      end
      it '他ユーザの詳細画面にアクセスできる' do
        visit user_path(1)
        expect(current_path).to eq user_path(1)
      end
      it '他ユーザの編集画面で編集ができる' do
        visit edit_admin_user_path(1)
        fill_in 'user_email', with: '2test2@test.com'
        fill_in 'user_password', with: 'test2_2'
        fill_in 'user_password_confirmation', with: 'test2_2'
        click_on 'Create my account'
        expect(page).to have_content '2test2@test.com'
      end
      it '他ユーザを削除できる' do
        page.accept_confirm do
          first(".btn-outline-danger").click
        end
        expect(page).not_to have_content 'test2' 
      end
    end
  end
end
