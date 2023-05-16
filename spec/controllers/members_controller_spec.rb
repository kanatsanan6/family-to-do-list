# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: params }

    let(:members) { create_list(:member, 3) }
    let(:params) { {} }

    before { members }

    it 'returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'returns all members' do
      subject

      expect(assigns(:members).size).to eq members.size
      expect(assigns(:members).first).to eq members.first
      expect(assigns(:members).second).to eq members.second
      expect(assigns(:members).third).to eq members.third
    end

    context 'with pagination' do
      let(:members) { create_list(:member, 11) }
      let(:params) { { page:2 } }

      before { members }

      it 'returns members on page 2'do
        subject

        expect(assigns(:members).size).to eq 1
        expect(assigns(:members).first).to eq members.last
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }

    let(:instance) { instance_double(Member) }

    before do
      allow(Member).to receive(:new).and_return(instance)
    end

    it 'returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders new template' do
      expect(subject).to render_template(:new)
    end

    it 'initiates new instance' do
      subject

      expect(assigns(:member)).to eq instance
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:params) { { member: { name: 'member' } } }

    it 'returns redirect' do
      expect(subject).to have_http_status(:redirect)
    end

    it 'creates a new member' do
      expect { subject }.to change { Member.count }.by(1)
    end

    it 'appends msg to flash'do
      subject

      expect(flash[:success]).to eq 'Create member successfully'
    end

    context 'when cannot save record' do
      before do
        allow_any_instance_of(Member).to receive(:save).and_return(false)
      end

      it 'returns unprocessable entity' do
        expect(subject).to have_http_status(:unprocessable_entity)
      end

      it 'renders new template' do
        expect(subject).to render_template(:new)
      end
    end
  end
end
