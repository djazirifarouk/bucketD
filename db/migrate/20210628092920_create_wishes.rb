class CreateWishes < ActiveRecord::Migration[6.1]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :description
      t.float :budget_achieved
      t.float :budget_plan
      t.integer :nb_likes
      t.datetime :goal_date
      t.integer :nb_contributors
      t.boolean :privacy

      t.timestamps
    end
  end
end
