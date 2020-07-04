require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "the home view of the application is not breaking" do
    visit "/"
  end

  # test "the average number for all movies is displayed on the view" do
    
  # end
end
