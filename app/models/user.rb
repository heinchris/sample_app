class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :booze_users
  has_many :boozes, :through => :booze_users

  def add_booze (booze_to_add, rating)
    bu = BoozeUser.new(:booze => booze_to_add, :user => self)
    bu.user_rating =  rating
    bu.save
  end

  def list_boozes
    booze_users.all.sort!{ |booze1, booze2| booze2.user_rating <=> booze1.user_rating }
  end
end
