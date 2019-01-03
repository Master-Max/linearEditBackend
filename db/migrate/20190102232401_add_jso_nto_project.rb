class AddJsoNtoProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :clips, :json
  end
end
