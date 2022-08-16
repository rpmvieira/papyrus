class CreateEngajados < ActiveRecord::Migration[7.0]
  def change
    create_table :engajados do |t|
      t.integer :pessoa_id
      t.integer :colaboracao_id
      # t.integer :engajamento_id
      t.string :status, default: 'inativo'
      # t.string :state

      t.timestamps
    end
  end
end
