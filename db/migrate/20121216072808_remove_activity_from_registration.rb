class RemoveActivityFromRegistration < ActiveRecord::Migration
  def up
    remove_column :registrations, :activity
  end

  def down
    add_column :registrations, :activity, :string
  end
end
