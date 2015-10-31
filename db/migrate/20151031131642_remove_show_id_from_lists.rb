class RemoveShowIdFromLists < ActiveRecord::Migration
  def change
  	remove_column :lists, :show_id
  end
end
