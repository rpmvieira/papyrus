class CreateEventos < ActiveRecord::Migration[7.0]
  def change
    create_table :eventos do |t|
      t.integer :engajamento_id
      t.integer :responsavel_id
      t.string :nome
      t.string :descricao
      t.string :inicio
      t.string :termino
      t.string :local
      t.string :status, default: 'criado'
      t.string :observacao

      t.timestamps
    end
  end
end
