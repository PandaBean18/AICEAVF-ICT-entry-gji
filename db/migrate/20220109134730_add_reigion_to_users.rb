class AddReigionToUsers < ActiveRecord::Migration[6.1]
    def change
        add_column(:users, :reigion, :string, null: false)
    end
end
