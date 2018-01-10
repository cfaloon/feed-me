class HomeController < ApplicationController
  before_action :authenticate_user!

  def stream
    @items = current_user.feeds.map(&:items).flatten.select(&:pubDate).sort { |x,y| y.pubDate <=> x.pubDate }
  end
end
