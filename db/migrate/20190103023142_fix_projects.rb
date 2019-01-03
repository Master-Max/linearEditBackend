class FixProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :exportedURL, :exported_url
  end
end
