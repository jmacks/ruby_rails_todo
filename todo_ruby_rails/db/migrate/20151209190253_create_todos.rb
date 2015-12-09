class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|

      t.string :content
      
      t.references :user
      t.references :list

      t.timestamps null: false
    end
  end
end
