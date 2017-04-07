class AddQtoQuizzes < ActiveRecord::Migration
  def change
  	add_column :questions, :Quiz_id, :integer
  end
end
