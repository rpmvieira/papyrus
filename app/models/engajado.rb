class Engajado < ApplicationRecord

	belongs_to :pessoa
	belongs_to :colaboracao
	has_one :colaborador, through: :colaboracao
	has_one :engajamento, through: :colaboracao
	has_many :contatos, through: :pessoa
	has_many :enderecos, through: :pessoa
	# belongs_to :colaboradores, :foreign_key => "ascendente_id", class_name: "Engajado"


	# belongs_to :vinculacao, :class_name=>"Engajado", :foreign_key => "vinculacao_id", optional: true
	belongs_to :ascendente, :class_name=>"Engajado", :foreign_key => "ascendente_id", optional: true
	has_many :descendentes, :class_name=>"Engajado", :foreign_key => "ascendente_id"

	# belongs_to :vinculacao, :class_name=>"Uo", :foreign_key => "vinculacao_id", optional: true
	# belongs_to :ascendente, :class_name=>"Uo", :foreign_key => "ascendente_id", optional: true
	# has_many :descendentes, :class_name=>"Uo", :foreign_key => "vinculacao_id"

	
	scope :deste_colaborador,lambda{|colaborador_id|joins(:colaboracao).where("colaboracoes.colaborador_id = ?",colaborador_id)}
	scope :liderancas, -> {where("engajados.lideranca = true")}

	def ativar;update_attribute(:status,"ativo");end
	def inativar;update_attribute(:status,"inativo");end

	def lideranca?
		return true if lideranca == true
		return false if lideranca == false
	end

end