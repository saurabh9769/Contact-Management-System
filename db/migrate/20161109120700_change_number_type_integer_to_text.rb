class ChangeNumberTypeIntegerToText < ActiveRecord::Migration
  def change
  	change_column :contacts, :number,  :text
  end
end
