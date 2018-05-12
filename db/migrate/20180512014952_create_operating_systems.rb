class CreateOperatingSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_systems do |t|
      t.string :name
      t.string :type
      t.string :screenshot 
    end
  end
end
