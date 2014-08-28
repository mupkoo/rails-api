class CreateTodos < ActiveRecord::Migration
    def change
        create_table :todos do |t|
            t.integer :user_id, null: false
            t.string :title
            t.boolean :is_completed, default: false

            t.timestamps
        end

        add_index :todos, :user_id
    end
end
