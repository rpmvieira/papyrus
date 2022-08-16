class CreateTPredicativos < ActiveRecord::Migration[7.0]
  def change
    create_table :t_predicativos do |t|
      t.string :nome
      t.integer :natureza_id
      t.integer :valor
      t.string :status, default: 'criado'

      t.timestamps
    end
  end
end
