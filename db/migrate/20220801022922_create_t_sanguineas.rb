class CreateTSanguineas < ActiveRecord::Migration[7.0]
  def change
    create_table :t_sanguineas do |t|
      
      t.string :nome
      t.string :tipo
      t.string :grupo
      t.string :fator_rh
      t.string :verdadeiro, default: false

      t.timestamps
    end
  end
end
