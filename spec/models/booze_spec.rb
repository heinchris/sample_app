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
end
