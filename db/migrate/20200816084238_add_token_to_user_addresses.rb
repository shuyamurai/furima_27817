class AddTokenToUserAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :user_addresses, :token, :string
  end
end
