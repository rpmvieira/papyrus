class Colaboracao < ApplicationRecord

	belongs_to :colaborador, class_name: "Pessoa"
	belongs_to :t_colaboracao
	belongs_to :engajamento

	has_many :engajados, :dependent => :destroy

	validates :colaborador_id, :engajamento_id, :t_colaboracao_id, presence: { message:"Não pode ficar em branco!" }
	validates :colaborador_id, uniqueness: { scope: [:engajamento_id, :t_colaboracao_id],    message: "Já existe uma colaboração com estas configurações" }

	scope :deste_colaborador,lambda{|colaborador_id| where("colaborador_id = ?",colaborador_id)}

end
