class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :Question, index: true, foreign_key: true
      t.boolean :correct
      t.string :text

      t.timestamps null: false
    end
  end
end
