class AddRecruiterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recruiter_id, :integer
  end
end
