class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      
      t.integer :enderecavel_id
      t.string :enderecavel_type
      t.string :logradouro
      t.string :bairro
      t.string :numero
      t.string :cep
      t.string :complemento
      t.integer :municipio_id
      t.string :observacao
      t.boolean :verificacao, default: false
      t.date :verificacao_data
      t.integer :verificacao_responsavel_id
      t.boolean :principal, default: false
      t.string :status, default: 'inativo'

      t.timestamps
    end
  end
end
