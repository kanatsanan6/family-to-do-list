# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteTasksWorker, type: :worker do
  describe 'sidekiq_options' do
    it { is_expected.to be_processed_in :default }
    it { is_expected.to be_retryable 0 }
  end

  describe '#perform'do
    subject(:perform) { described_class.new.perform }

    it 'deletes all tasks' do
      expect(Task).to receive(:destroy_all)

      perform
    end
  end
end
