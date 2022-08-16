class CreateTContatos < ActiveRecord::Migration[7.0]
  def change
    create_table :t_contatos do |t|
      t.string :nome
      t.string :classe

      t.timestamps
    end
  end
end
