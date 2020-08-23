class ChangeInvitedToString < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :invited, :string, default: ""
  end
end
