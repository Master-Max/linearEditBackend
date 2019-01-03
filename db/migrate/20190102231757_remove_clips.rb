class RemoveClips < ActiveRecord::Migration[5.2]
  def change
    drop_table :clips
  end
end
