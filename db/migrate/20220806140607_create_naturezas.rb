class CreateNaturezas < ActiveRecord::Migration[7.0]
  def change
    create_table :naturezas do |t|
      t.string :nome
      t.string :marcador

      t.timestamps
    end
  end
end
