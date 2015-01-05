class AddModerateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :moderate, :boolean
  end
end
