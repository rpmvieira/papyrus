class Etnia < ApplicationRecord

	has_many :pessoas

	validates :nome, presence: { message:"Não pode ficar em branco!" }
	
end
