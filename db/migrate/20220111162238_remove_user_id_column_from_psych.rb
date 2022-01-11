class RemoveUserIdColumnFromPsych < ActiveRecord::Migration[6.1]
    def change
        remove_column(:psychiatrists, :user_id)
    end
end
