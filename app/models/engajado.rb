class Engajado < ApplicationRecord

	belongs_to :pessoa
	belongs_to :colaboracao
	has_one :colaborador, through: :colaboracao
	has_one :engajamento, through: :colaboracao
	has_many :contatos, through: :pessoa
	has_many :enderecos, through: :pessoa
	has_many :adesivacoes

	belongs_to :ascendente, :class_name=>"Engajado", :foreign_key => "ascendente_id", optional: true
	has_many :descendentes, :class_name=>"Engajado", :foreign_key => "ascendente_id"

	scope :deste_colaborador,lambda{|colaborador_id|joins(:colaboracao).where("colaboracoes.colaborador_id = ?",colaborador_id)}
	scope :liderancas, -> {where("engajados.lideranca = true")}
	scope :colaboradores, -> {where("engajados.lideranca = false")}
	# scope :da_pergunta,lambda{|responsavel_id|joins(:adesivacao).where("adesivacoes.responsavel_id = ?",responsavel_id)}

	def ativar;update_attribute(:status,"ativo");end
	def inativar;update_attribute(:status,"inativo");end

	def lideranca?
		return true if lideranca == true
		return false if lideranca == false
	end

	
end