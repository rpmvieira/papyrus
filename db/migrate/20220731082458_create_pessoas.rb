class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :mae
      t.date :nascimento
      t.integer :sexo_id, default: 1
      t.integer :t_sanguinea_id, default: 1
      t.integer :etnia_id, default: 1

      t.integer :est_civil_id, default: 1
      t.integer :nacionalidade_id, default: 1
      t.integer :naturalidade_id, default: 1
      
      t.boolean :verificacao, default: false
      t.date :verificacao_data
      t.integer :verificacao_responsavel_id
      t.string :status, default: 'inativo'

      t.timestamps
    end
    add_index :pessoas, :cpf, unique: true
  end
end
