class AddEmailToPsych < ActiveRecord::Migration[6.1]
    def change
        add_column(:psychiatrists, :email, :string, null: false)
    end
end