class Project < ApplicationRecord
  belongs_to :user

  def assemble_movie
    path = "/Users/mx/tmp/#{self.id}/"
    array = JSON.parse(self.clips)
    list = ""
    # byebug
    # hash = array.map { |clip| JSON.parse(clip) }

    array.each_with_index{|clip, i|
      output = `youtube-dl -o "/Users/mx/tmp/#{self.id}/#{i}.%(ext)s" -f "best[ext=mp4]" "#{clip["sourceURL"]}"`
      if File.exists?("/Users/mx/tmp/#{self.id}/#{i}.mp4")
        output = `ffmpeg -i "/Users/mx/tmp/#{self.id}/#{i}.mp4" -ss #{clip["playerIN"]} -to #{clip["playerOUT"]} -async 1 "/Users/mx/tmp/#{self.id}/clip#{i}.mp4"`
        list += "file 'clip#{i}.mp4'\n"
      end
    }

    if File.write("/Users/mx/tmp/#{self.id}/list.txt", list)
      wasGood = `ffmpeg -y -f concat -safe 0 -i /Users/mx/tmp/#{self.id}/list.txt -c copy /Users/mx/tmp/#{self.id}/#{self.name}.mp4`
    end

    out = Cloudinary::Uploader.upload_large "/Users/mx/tmp/#{self.id}/#{self.name}.mp4"

    self.exported_url = out["url"]
  end
end
