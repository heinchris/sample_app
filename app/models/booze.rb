class Booze < ActiveRecord::Base
  validates :name, :presence => true
  validates :rating, :inclusion => (1..10)
  has_many :booze_users
  has_many :users, :through => :booze_users

  def get_user_rating(user)
    if booze_users != []
      return booze_users.select{|bu| bu.user == user}[0].user_rating
    end
      "Not Rated"
  end

end
