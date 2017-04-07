class RemovePrevCol < ActiveRecord::Migration
  def change
  	remove_column :questions, :Quiz_id
  end
end
