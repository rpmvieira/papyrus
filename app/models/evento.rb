class Evento < ApplicationRecord

	belongs_to :engajamento
	belongs_to :responsavel, :class_name=>"Colaboracao"
	has_many :participantes, :class_name=>"Engajado"

	validates :engajamento_id, :responsavel_id,:nome, :inicio, :termino, :local, presence: { message:"Não pode ficar em branco!" }
	validate :inicio_menor_que_termino

	datetime_scopes :inicio
	scope :deste_responsavel_id,lambda{|responsavel_id| where("eventos.responsavel_id = ?",responsavel_id)}

	def inicio_menor_que_termino
		if inicio.present? and termino.present?
			if inicio > termino 
				errors.add(:base,"O término não pode ser anterior ao início")
			end
		end
	end

end
