# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::TasksController, type: :controller do
  describe 'GET #index' do
    subject(:call) { get :index }

    let(:member_a) { create(:member) }
    let(:task_a) { create(:task, title: 'task_a', member: member_a, state: :completed) }
    let(:task_b) { create(:task, title: 'task_b', member: member_a, state: :completed) }
    let(:task_c) { create(:task, title: 'task_c', member: member_a, state: :delayed) }

    let(:member_b) { create(:member) }
    let(:task_d) { create(:task, title: 'task_d', member: member_b, state: :completed) }
    let(:task_e) { create(:task, title: 'task_e', member: member_b, state: :completed) }
    let(:task_f) { create(:task, title: 'task_f', member: member_b, state: :delayed) }

    let(:member_c) { create(:member) }

    before do
      task_a
      task_b
      task_c
      task_d
      task_e
      task_f
    end

    it 'returns ok' do
      expect(call).to have_http_status(:ok)
    end

    it 'returns each member\'s outstanding completed tasks' do
      call

      response_body = JSON.parse(response.body)
      expect(response_body.pluck('name')).to match_array([member_a.name, member_b.name])
      expect(response_body.first['tasks'].map { |x| x['title'] }).to match_array([task_a.title, task_b.title])
      expect(response_body.second['tasks'].map { |x| x['title'] }).to match_array([task_d.title, task_e.title])
    end
  end
end
