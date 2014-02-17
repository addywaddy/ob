class Tag < ActiveRecord::Base
  belongs_to :account
  validates :name, :pattern, presence: true
end
