class Poll < ApplicationRecord
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true
  has_many :votes, through: :options
end
