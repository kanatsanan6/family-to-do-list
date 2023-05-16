# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Schedule::EveryMidnightWorker, type: :worker do
  describe '#perform' do
    subject(:perform) { described_class.new.perform }

    let(:completed_task) { create(:task, state: :completed) }
    let(:incompleted_task) { create(:task, state: :incompleted) }
    let(:delayed_task) { create(:task, state: :delayed) }

    before do
      completed_task
      incompleted_task
      delayed_task
    end

    it 'calls #dalayed! on incompleted task' do
      expect { perform }.to change { incompleted_task.reload.state }.to('delayed')
    end
  end
end
