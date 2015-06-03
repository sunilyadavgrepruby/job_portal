class AddEmailToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :organization_email, :string
  end
end
