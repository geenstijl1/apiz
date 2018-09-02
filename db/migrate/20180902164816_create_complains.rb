class CreateComplains < ActiveRecord::Migration[5.2]
  def change
    create_table :complains do |t|
      t.text :complain

      t.timestamps
    end
  end
end
