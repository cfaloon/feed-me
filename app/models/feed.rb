class Feed < ApplicationRecord

  validates :url, uniqueness: true

  def rss_response
    @rss_response ||= HTTParty.get(self.url)['rss']
  end

  def items
    @items ||= self.rss_response['channel']['item'].map { |item_hash| FeedItem.new(item_hash) }
  end

  def image
    self.rss_response['channel']['image']['url'] || self.rss_response['channel']['image']['href']
  end

  def title
    self.rss_response['channel']['title']
  end

  def description
    @description ||= if self.rss_response['channel']['description'].class == Array
      @description = self.rss_response['channel']['description'].first
    else
      @description = self.rss_response['channel']['description']
    end
  end
end
