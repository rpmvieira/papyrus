module EnderecosHelper

	def helper_endereco(endereco)
		e = ""
		if endereco.present?
			e << "#{endereco.logradouro}, #{endereco.numero}, bairro: #{endereco.bairro}"
			e << " - #{endereco.municipio.nome}/#{endereco.estado.sigla}"
			e << ". CEP: #{endereco.cep}" if endereco.cep.present?
		else
			e << "-"
		end
		return e
	end

end
