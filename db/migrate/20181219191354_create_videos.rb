class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :source_url
      t.string :stream_url
      t.timestamps
    end
  end
end
