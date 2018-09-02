class AddUserIdToComplains < ActiveRecord::Migration[5.2]
  def change
    add_reference :complains, :user, foreign_key: true
  end
end
