class CreateEngajados < ActiveRecord::Migration[7.0]
  def change
    create_table :engajados do |t|
      t.integer :pessoa_id
      t.integer :colaboracao_id
      t.boolean :lideranca, default: false
      t.string :grupo_lideranca
      t.integer :ascendente_id
      t.string :status, default: 'inativo'
      t.string :observacao

      t.timestamps
    end
  end
end
