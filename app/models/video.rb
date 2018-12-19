class Video < ApplicationRecord
  def get_stream_url
    output = `youtube-dl -g -f best "#{self.source_url}"`.chomp
    self.stream_url = output
  end
end
