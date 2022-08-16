class CreateSexos < ActiveRecord::Migration[7.0]
  def change
    create_table :sexos do |t|

      t.string :nome
      t.string :descricao
      t.text :observacoes

      t.timestamps
    end
  end
end
