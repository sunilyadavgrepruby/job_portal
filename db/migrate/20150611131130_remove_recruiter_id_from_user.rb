class RemoveRecruiterIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :recruiter_id, :integer
  end
end
