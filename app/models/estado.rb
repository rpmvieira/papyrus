class Estado < ApplicationRecord

	has_many :municipios

	validates :nome, :sigla, presence: { message:"Não pode ficar em branco!" }

end
