class CreateMensagens < ActiveRecord::Migration[7.0]
  def change
    create_table :mensagens do |t|
      t.integer :destinatario_id
      t.string :destinatario_type
      t.string :conteudo
      t.boolean :entregue
      t.string :observacao

      t.timestamps
    end
  end
end
