class CreateContatos < ActiveRecord::Migration[7.0]
  def change
    create_table :contatos do |t|
      
      t.integer :contatavel_id
      t.string :contatavel_type
      t.integer :t_contato_id
      t.string :contato
      t.boolean :principal, default: false
      t.string :observacao
      t.string :status, default: 'inativo'

      t.timestamps
    end
  end
end
