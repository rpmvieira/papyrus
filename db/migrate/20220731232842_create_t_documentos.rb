class CreateTDocumentos < ActiveRecord::Migration[7.0]
  def change
    create_table :t_documentos do |t|
      
      t.string :nome
      t.string :descricao
      t.integer :tipo
      t.boolean :principal, default: false

      t.timestamps
    end
  end
end
