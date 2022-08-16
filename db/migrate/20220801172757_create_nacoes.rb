class CreateNacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :nacoes do |t|
      t.string :nome
      t.string :codigo
      t.string :alpha3

      t.timestamps
    end
  end
end
