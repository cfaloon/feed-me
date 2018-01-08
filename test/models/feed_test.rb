require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'url with RSS response is valid' do
    assert build(:feed).valid?
  end

  test 'url with non-RSS response is invalid' do
    url = 'https://www.discogs.com/The-System-Dont-Disturb-This-Groove/master/129801'
    assert_not build(:feed, url: url).valid?
  end
end
