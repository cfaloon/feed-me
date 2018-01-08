require 'rss'
require 'open-uri'

class Feed < ApplicationRecord
  # relations
  has_many :subscriptions
  has_many :users, through: :subscriptions
  # validations
  validates :url, uniqueness: true

  def rss_response
    @rss_response ||= RSS::Parser.parse(open(self.url))
  end

  def items
    self.rss_response.items
  end

  def image
    self.rss_response.image ? self.rss_response.image.url : nil
  end

  def title
    self.rss_response.channel.title
  end

  def description
    self.rss_response.channel.description
  end
end
