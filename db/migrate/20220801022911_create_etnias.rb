class CreateEtnias < ActiveRecord::Migration[7.0]
  def change
    create_table :etnias do |t|
      
      t.string :nome

      t.timestamps
    end
  end
end
