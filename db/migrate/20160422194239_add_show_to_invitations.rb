class AddShowToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :show, :integer, default: 1
  end
end
