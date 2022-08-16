class CreateEngajamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :engajamentos do |t|
      t.string :nome
      t.text :descricao
      t.integer :natureza_id
      t.integer :responsavel_id
      t.string :status, default: 'criado'

      t.timestamps
    end
  end
end
