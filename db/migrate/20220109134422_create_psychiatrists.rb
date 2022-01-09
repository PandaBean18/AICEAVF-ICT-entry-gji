class CreatePsychiatrists < ActiveRecord::Migration[6.1]
    def change
        create_table :psychiatrists do |t|
            t.string :name, null: false 
            t.string :reigion, null: false
            t.integer :user_id, null: false
            t.timestamps
        end
        add_index(:psychiatrists, :name)
    end
end
