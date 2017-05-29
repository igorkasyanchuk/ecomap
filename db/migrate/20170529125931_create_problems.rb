class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :solution
      t.decimal :lat
      t.decimal :lng
      t.references :problem_category, foreign_key: true
      t.boolean :moderated, default: false
      t.boolean :solved, default: false
      t.integer :likes, default: 0
      t.integer :user_id, default: nil
      t.integer :stars, default: 3

      t.timestamps
    end
  end
end
