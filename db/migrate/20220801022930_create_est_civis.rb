class CreateEstCivis < ActiveRecord::Migration[7.0]
  def change
    create_table :est_civis do |t|
      
      t.string :nome

      t.timestamps
    end
  end
end
