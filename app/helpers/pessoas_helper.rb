module PessoasHelper

	def denominacao(pessoa)
		if pessoa.nome.present? && pessoa.apelido.present?
			return "(#{pessoa.apelido}) #{pessoa.nome}"
		elsif pessoa.nome.present? && !pessoa.apelido.present?
			return "#{pessoa.nome}"
		elsif !pessoa.nome.present? && pessoa.apelido.present?
			return "(#{pessoa.apelido})"
		else
			return "-"
		end
	end

end
