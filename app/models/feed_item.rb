class FeedItem

  attr_reader :title, :link, :pub_date, :creator, :description
  
  def initialize(item_hash)
    @item_hash = item_hash
    @title = item_hash['title']
    @link = item_hash['link'].class == Array ? item_hash['link'].first : item_hash['link']
    @pub_date = Date.parse(item_hash['pubDate'])
    @creator = item_hash['creator']
    @description = item_hash['description']
  end
end
