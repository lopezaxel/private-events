class AddInvitedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :invited, :integer
  end
end
