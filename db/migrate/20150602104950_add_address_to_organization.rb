class AddAddressToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :organization_address, :string
  end
end
