class AddPublicToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :public, :boolean, default: true
  end
end
