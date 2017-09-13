require 'test_helper'

class PhrasesControllerTest < ActionController::TestCase
  
  test cannot_save_empty_phrase do
    phrase = Phrase.new(content: "")
    assert_not phrase.save
  end
  
  describe "GET random" do
    before(:each) do
      @phrase = Phrase.new(content: "test phrase")
      get 'random', :format => :json
    end
    
    it "should be successful"
      response.should be_successful
    end
    
    it "should return correct phrase" do
      body = JSON.parse(response.body)
      body["id"].should == @phrase.id
    end
  end
end
