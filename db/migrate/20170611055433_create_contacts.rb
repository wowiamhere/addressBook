class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.numeric :phone
      t.string :address
      t.string :company
      t.date :birtday

      t.timestamps
    end
  end
end
