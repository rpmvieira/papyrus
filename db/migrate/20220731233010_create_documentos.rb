class CreateDocumentos < ActiveRecord::Migration[7.0]
  def change
    create_table :documentos do |t|
      
      t.integer :documentavel_id
      t.string :documentavel_type
      t.integer :t_documento_id
      t.string :numero
      t.string :emissor
      t.date :emissao
      t.integer :uf_id
      t.string :zona_eleitoral
      t.string :secao
      t.string :serie
      t.string :visto
      t.string :livro
      t.string :folha
      t.string :observacao
      t.boolean :verificacao, default: false
      t.date :verificacao_data
      t.integer :verificacao_responsavel_id

      t.timestamps
    end
  end
end
