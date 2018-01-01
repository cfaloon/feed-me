class Feed < ApplicationRecord

  def rss_response
    @rss_response ||= HTTParty.get(self.url)['rss']
  end

  def items
    self.rss_response['channel']['item']
  end

  %w(url title link).each do |attribute|
    define_method "image_#{attribute}" do
      self.rss_response['channel']['image'][attribute]
    end
  end

  %w(title description).each do |method_name|
    define_method method_name do
      self.rss_response['channel'][method_name]
    end
  end
end
