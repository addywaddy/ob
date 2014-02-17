class Account < ActiveRecord::Base
  has_many :transactions
  has_many :tags

  def to_param
    number
  end
end
