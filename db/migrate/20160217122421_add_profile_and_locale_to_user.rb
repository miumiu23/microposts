class AddProfileAndLocaleToUser < ActiveRecord::Migration

  def change
    add_column :users, :profile, :string
    add_column :users, :locale, :string
  end
end
