class CreateColaboracoes < ActiveRecord::Migration[7.0]
  def change
    create_table :colaboracoes do |t|
      t.integer :colaborador_id
      t.integer :t_colaboracao_id
      t.integer :engajamento_id
      t.string :status, default: 'criado'

      t.timestamps
    end
  end
end
