class AddNicknameToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :player_nickname, :string
  end
end
