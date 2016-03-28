class ChangeBirthdayTypeOfUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :birthday, :date
  end

  def down
    change_column :users, :birthday, :datetime
  end
end
