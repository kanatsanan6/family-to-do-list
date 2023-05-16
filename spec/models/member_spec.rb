# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  include_examples 'valid_factory'

  describe 'validations' do
    subject { create(:member) }

    it { is_expected.to validate_presence_of(:name) }
  end
end
