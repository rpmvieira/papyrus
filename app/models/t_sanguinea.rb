class TSanguinea < ApplicationRecord

	has_many :pessoas

	validates :nome, :grupo, :fator_rh, presence: { message:"Não pode ficar em branco!" }
end
