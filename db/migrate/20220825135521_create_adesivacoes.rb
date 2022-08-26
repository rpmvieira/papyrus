class CreateAdesivacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :adesivacoes do |t|
      t.integer :responsavel_id
      t.integer :engajamento_id
      t.integer :engajado_id
      t.integer :tipo_id
      t.string :placa
      t.string :status, default: 'criado'

      t.timestamps
    end
  end
end
