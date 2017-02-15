class AddProfileInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :place, :string
    add_column :users, :self_introduction, :string
  end
end
