require 'spec_helper'

describe Booze do
  describe "validations work correctly" do
    it "should fail to create if it doesn't have a name" do
      booze = Booze.new(:name =>"", :rating => 5)
      booze.should_not be_valid
    end

    it "should fail to create if rating is not from 1-10" do
      booze = Booze.new(:name =>"name", :rating => 11)
      booze.should_not be_valid
      booze = Booze.new(:name =>"name", :rating => 0)
      booze.should_not be_valid
    end
  end

  describe "boozes can get user ratings given a user object" do
    it "should allow a booze to report a specific users rating" do
        booze = Factory(:booze)
        user = Factory(:user, :email => "new@new.com")
        bu = BoozeUser.create(:user=>user, :booze =>booze, :user_rating => 9)
        bu.save!
        booze = Booze.find(booze.id)
        booze.get_user_rating(user).should == 9
    end
    it "should not fail if the booze does not have a user rating" do
        booze = Factory(:booze)
        user = Factory(:user, :email => "new@new.com")
        booze.get_user_rating(user).should == "Not Rated"
    end
  end
end
