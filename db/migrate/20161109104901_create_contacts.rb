class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.text :first_name
    	t.text :last_name
    	t.integer :number
    	t.text :email_id

      t.timestamps null: false
    end
  end
end
