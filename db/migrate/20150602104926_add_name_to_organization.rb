class AddNameToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :organization_name, :string
  end
end
