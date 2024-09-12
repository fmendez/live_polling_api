class Poll < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :votes, through: :options
end
