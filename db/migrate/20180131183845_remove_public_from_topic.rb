class RemovePublicFromTopic < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :public, :boolean
  end
end
