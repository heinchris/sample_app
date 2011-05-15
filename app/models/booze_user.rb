class BoozeUser < ActiveRecord::Base
  belongs_to :booze
  belongs_to :user


  def to_s
    booze.name + " - " + booze.rating.to_s + " - " + user_rating.to_s
  end

end
