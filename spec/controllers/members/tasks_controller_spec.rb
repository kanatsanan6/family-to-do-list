# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Members::TasksController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: params }

    let(:tasks) { create_list(:task, 3, member: member) }
    let(:member) { create(:member) }
    let(:params) { { member_id: member.id } }

    before { tasks }

    it 'returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'returns all tasks' do
      subject

      expect(assigns(:tasks).size).to eq tasks.size
      expect(assigns(:tasks).first).to eq tasks.first
      expect(assigns(:tasks).second).to eq tasks.second
      expect(assigns(:tasks).third).to eq tasks.third
    end

    it 'orders by state' do
      tasks.first.delayed!
      tasks.second.completed!
      tasks.third.incompleted!

      subject

      expect(assigns(:tasks).first).to eq tasks.third
      expect(assigns(:tasks).second).to eq tasks.second
      expect(assigns(:tasks).third).to eq tasks.first
    end

    context 'with pagination' do
      let(:tasks) { create_list(:task, 6, member: member) }
      let(:params) { { page: 2, member_id: member.id } }

      before { tasks }

      it 'returns tasks on page 2' do
        subject

        expect(assigns(:tasks).size).to eq 1
        expect(assigns(:tasks).first).to eq tasks.last
      end
    end
  end

  describe 'GET #new' do
    subject { get :new, params: params }

    let(:instance) { instance_double(Task) }
    let(:member) { create(:member) }
    let(:params) { { member_id: member.id } }

    before do
      allow_any_instance_of(Member).to receive_message_chain(:tasks, :new)
        .and_return(instance)
    end

    it 'returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders new template' do
      expect(subject).to render_template(:new)
    end

    it 'initiates new instance' do
      subject

      expect(assigns(:task)).to eq instance
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    before { request.env['HTTP_REFERER']  = 'http://localhost:3000/members/1/tasks/new' }

    let(:params) do
      {
        member_id: member.id,
        task: {
          title: 'walk a dog',
          member_id: member.id
        }
      }
    end

    let(:member) { create(:member) }

    it 'returns redirect' do
      expect(subject).to have_http_status(:redirect)
    end

    it 'redirect to task url' do
      expect(subject).to redirect_to(member_tasks_url(member))
    end
  end

  describe 'PUT #update' do
    subject { post :update, params: params }

    before { request.env['HTTP_REFERER']  = 'http://localhost:3000/members/1/tasks' }

    let(:params) do
      { member_id: member.id, id: task.id }
    end

    let(:task) { create(:task) }
    let(:member) { task.member }

    it 'returns redirect' do
      expect(subject).to have_http_status(:redirect)
    end

    it 'redirect to task url' do
      expect(subject).to redirect_to(member_tasks_url(member))
    end
  end
end
