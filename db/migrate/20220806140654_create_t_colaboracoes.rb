class CreateTColaboracoes < ActiveRecord::Migration[7.0]
  def change
    create_table :t_colaboracoes do |t|
      t.string :nome
      t.integer :natureza_id
      t.string :descricao
      t.string :status, default: 'criado'

      t.timestamps
    end
  end
end
