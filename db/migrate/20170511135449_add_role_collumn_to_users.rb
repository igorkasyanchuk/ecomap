class AddRoleCollumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :integer
  end
end
