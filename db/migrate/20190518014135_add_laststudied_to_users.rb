class AddLaststudiedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :laststudied, :date
  end
end
