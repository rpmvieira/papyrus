class TDocumento < ApplicationRecord

	has_many :documentos

	validates :nome, :descricao, presence: { message:"Não pode ficar em branco!" }

	enum tipo: { 'Primário'=> 1, 'Secundário'=> 2 }

end
