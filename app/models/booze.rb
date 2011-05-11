class Booze < ActiveRecord::Base
  validates :name, :presence => true
  validates :rating, :inclusion => (1..10)
  has_many :booze_users
  has_many :users, :through => :booze_users


end
