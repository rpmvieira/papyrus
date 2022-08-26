class Engajamento < ApplicationRecord

	belongs_to :natureza
	belongs_to :responsavel, :class_name=>"Pessoa"
	has_many :colaboracoes#, :foreign_key => "colaboracao_id"
	has_many :engajados, through: :colaboracoes#, :foreign_key => "colaboracao_id"
	has_many :eventos
	has_many :adesivacoes

	def responsavel?(usuario)
		if responsavel_id == usuario.pessoa_id
			return true
		else
			return false
		end
	end

	def coordenador?(usuario);begin;return colaboracoes.find_by_t_colaboracao_id_and_colaborador_id(TColaboracao.find_by_nome("Coordenação").id,usuario.id);rescue Exception => e;return nil;end;end

	def coordenador_geral?(usuario);begin;return colaboracoes.find_by_t_colaboracao_id_and_colaborador_id(TColaboracao.find_by_nome("Coordenação Geral").id,usuario.id);rescue Exception => e;return nil;end;end

	def coordenadoria?(usuario)
		if coordenador?(usuario) || coordenador_geral?(usuario)
			return coordenador?(usuario) || coordenador_geral?(usuario)
		else
			return false
		end
	end

	def acesso_visualizacao(usuario);if coordenadoria?(usuario) || responsavel?(usuario);return true;else;return false;end;end

end
