# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  include_examples 'valid_factory'

  describe 'associations' do
    it { is_expected.to belong_to(:member).counter_cache(true) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:state).with_values(%i[incompleted completed delayed]) }
  end

  describe 'validations' do
    subject { create(:task) }

    it { is_expected.to validate_presence_of(:title) }
  end
end
