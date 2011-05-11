require 'spec_helper'

describe User do
  describe "Users have booze ratings of their own" do
    it "should allow a user to be associated to a booze" do
      user = Factory(:user)
      booze = Factory(:booze)
      user.boozes << booze
      user.boozes.should_not be_empty
      user.boozes.size.should == 1
    end

    it "should allow a user to add a booze with a rating" do
      user = Factory(:user)
      booze = Factory(:booze)
      user.add_booze(booze, 1)
      user.boozes.should_not be_empty
      user.boozes.size.should == 1
    end

    it "should allow a user to list off all of their boozes ordered by rating" do
      user = Factory(:user)
      booze = Factory(:booze)
      user.add_booze(booze, 1)
      booze2 = Factory(:booze, :name => "booze2")
      user.add_booze(booze2, 5)
      user.list_boozes[0].booze.should == booze2
    end
  end
end
