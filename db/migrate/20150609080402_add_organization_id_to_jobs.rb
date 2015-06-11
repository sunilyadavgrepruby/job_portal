class AddOrganizationIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :organization_id, :Integer
  end
end
