class Engajado < ApplicationRecord

	belongs_to :pessoa
	# belongs_to :engajamento
	belongs_to :colaboracao
	has_one :colaborador, through: :colaboracao
	has_one :engajamento, through: :colaboracao
	has_many :contatos, through: :pessoa
	has_many :enderecos, through: :pessoa
	
	scope :deste_colaborador,lambda{|colaborador_id|joins(:colaboracao).where("colaboracoes.colaborador_id = ?",colaborador_id)}

	def ativar;update_attribute(:status,"ativo");end
	def inativar;update_attribute(:status,"inativo");end



end