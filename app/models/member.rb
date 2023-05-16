# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  tasks_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Member < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
