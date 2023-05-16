# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: params }

    let(:tasks) { create_list(:task, 3) }
    let(:params) { {} }

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
      let(:tasks) { create_list(:task, 6) }
      let(:params) { { page: 2 } }

      before { tasks }

      it 'returns tasks on page 2' do
        subject

        expect(assigns(:tasks).size).to eq 1
        expect(assigns(:tasks).first).to eq tasks.last
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }

    let(:instance) { instance_double(Task) }

    before do
      allow(Task).to receive(:new).and_return(instance)
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

    before { request.env['HTTP_REFERER']  = 'http://localhost:3000/tasks/new' }

    let(:params) do
      { task: { member_id: member.id, title: 'walk a dog' } }
    end

    let(:member) { create(:member) }

    it 'returns redirect' do
      expect(subject).to have_http_status(:redirect)
    end

    it 'redirect to task url' do
      expect(subject).to redirect_to(tasks_url)
    end

    it 'creates a new member' do
      expect { subject }.to change { member.reload.tasks.count }.by(1)
    end

    it 'creates a task with incomplete state' do
      subject

      expect(member.reload.tasks.last).to be_incompleted
    end

    it 'appends msg to flash' do
      subject

      expect(flash[:success]).to eq 'Create task successfully'
    end

    context 'when cannot save record' do
      before do
        allow_any_instance_of(Task).to receive(:save).and_return(false)
      end

      it 'returns unprocessable entity' do
        expect(subject).to have_http_status(:unprocessable_entity)
      end

      it 'renders new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: params }

    before { request.env['HTTP_REFERER'] = 'http://localhost:3000/tasks' }

    let(:params) { { id: task.id } }
    let(:task) { create(:task) }

    it 'returns redirect' do
      expect(subject).to have_http_status(:redirect)
    end

    it 'redirects to tasks url' do
      expect(subject).to redirect_to(tasks_url)
    end

    it 'changes task state to completed' do
      expect { subject }.to change { task.reload.state }.to('completed')
    end

    it 'appends msg to flash' do
      subject

      expect(flash[:success]).to eq 'Mark task as completed'
    end

    context 'when task not found' do
      before { task.destroy }

      it 'raises ActiveRecord::RecordNotFound' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when cannot update record' do
      before do
        allow_any_instance_of(Task).to receive(:completed!).and_return(false)
      end

      it 'redirects to tasks_url' do
        expect(subject).to redirect_to(tasks_url)
      end
    end
  end
end
