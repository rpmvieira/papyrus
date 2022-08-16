class Nacao < ApplicationRecord

	has_many :p_nacionais, class_name: "Pessoa", :foreign_key => "nacionalidade_id"

	validates :nome, presence: { message:"Não pode ficar em branco!" }
	validates :nome, uniqueness: { message: "Já existe registro com estas configurações" }

end
