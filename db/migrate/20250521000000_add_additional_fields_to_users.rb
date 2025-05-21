class AddAdditionalFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :website_url, :string
    add_column :users, :promo_code, :string
    add_column :users, :active, :boolean, default: true, null: false

    # Add indexes for performance
    add_index :users, :role
    add_index :users, :active
    add_index :users, :promo_code
  end
end
