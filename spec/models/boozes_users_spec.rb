require 'spec_helper'

describe BoozeUser do
  describe "The to_s method" do
    it "should return out a booze name and the general rating, then the user rating" do
      expected = "DemoBooze - 5 - 1"
      booze = Factory(:booze)
      user = Factory(:user)
      bu = BoozeUser.new(:booze =>booze, :user => user)
      bu.user_rating = 1
      bu.to_s.should == expected
    end

  end

end
