# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  state      :integer          default(0), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :bigint           not null
#
class Task < ApplicationRecord
  paginates_per 5

  belongs_to :member, counter_cache: true

  enum state: {
    incompleted: 0,
    completed: 1,
    delayed: 2
  }

  validates :title, presence: true
end
