require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(
          title: '',
          content: 'miss_content',
          deadline: 'miss_deadline',
          priority: 'miss_priority',
          status: 'miss_status')
        expect(task).not_to be_valid
      end
    end
      context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(
          title: 'miss_title',
          content: '',
          deadline: 'miss_deadline',
          priority: 'miss_priority',
          status: 'miss_status'
        )
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(
          title: 'hit_title',
          content: 'hit_content',
          deadline: 'hit_deadline',
          priority: 'hit_priority',
          status: 'hit_status'
        )
        expect(task).to be_valid
      end
    end
  end
end

