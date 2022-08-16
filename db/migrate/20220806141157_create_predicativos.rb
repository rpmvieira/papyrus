class CreatePredicativos < ActiveRecord::Migration[7.0]
  def change
    create_table :predicativos do |t|
      t.integer :t_predicante_id
      t.integer :t_predicativo_id
      t.integer :registro_responsavel_id
      t.date :registro_data
      t.string :status, default: 'criado'

      t.timestamps
    end
  end
end
