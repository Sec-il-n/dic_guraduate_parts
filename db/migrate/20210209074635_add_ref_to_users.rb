class AddRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :corporation, foreign_key: true
    add_reference :users, :proprietorship, foreign_key: true
  end
end
