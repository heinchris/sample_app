require 'spec_helper'

describe BoozeUserController do

  describe "GET 'add'" do
    it "should be successful" do
      get 'add'
      response.should be_success
    end
  end

  describe "GET 'remove'" do
    it "should be successful" do
      get 'remove'
      response.should be_success
    end
  end

end
