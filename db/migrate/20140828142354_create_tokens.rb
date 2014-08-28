class CreateTokens < ActiveRecord::Migration
    def change
        create_table :tokens do |t|
            t.integer :user_id
            t.string :token
            t.datetime :expiresAt

            t.timestamps
        end

        add_index :tokens, :token, unique: true
    end
end
