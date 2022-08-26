class Adesivacao < ApplicationRecord

	belongs_to :responsavel, :class_name=>"Colaboracao"
	belongs_to :engajamento
	belongs_to :engajado

	has_one :pessoa, through: :engajado

	validates :responsavel_id, :engajamento_id, :engajado_id, :tipo_id, :placa, presence: { message:"Não pode ficar em branco!" }

	# scope :deste_coordenador,lambda{|responsavel_id|joins(:colaboracao).where("adesivacoes.responsavel_id = ?",responsavel_id)}
	scope :deste_coordenador,lambda{|responsavel_id| where("adesivacoes.responsavel_id = ?",responsavel_id)}

	enum tipo_id: {'Carro'=> 1, 'Moto'=> 2 }

end
