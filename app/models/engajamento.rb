class Engajamento < ApplicationRecord

	belongs_to :natureza
	belongs_to :responsavel, :class_name=>"Pessoa"

	# has_rich_text :descricao

	has_many :colaboracoes#, :foreign_key => "colaboracao_id"
	has_many :engajados, through: :colaboracoes#, :foreign_key => "colaboracao_id"


	def responsavel?(usuario)
		if responsavel_id == usuario.pessoa_id
			return true
		else
			return false
		end
	end

	def lideranca?(usuario)
		begin
			return colaboracoes.find_by_t_colaboracao_id_and_colaborador_id(TColaboracao.find_by_nome("Liderança").id,usuario.id)
		rescue Exception => e
			return nil
		end
	end

end
