class TContato < ApplicationRecord

	has_many :contatos

	validates :nome, presence: { message:"Não pode ficar em branco!" }

end
