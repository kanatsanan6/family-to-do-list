# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples_for 'valid_factory' do
  subject { build(described_class.name.underscore.to_sym) }

  it { is_expected.to be_valid }
end
