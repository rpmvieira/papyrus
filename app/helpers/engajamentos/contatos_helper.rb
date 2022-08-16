module Engajamentos::ContatosHelper

	def formata_contato(contato,param=nil)
		if param == 'Celular'
			return number_to_phone(contato, pattern: /(\d{1,2})(\d{5})(\d{4})$/, area_code: true)
		elsif param == 'Felular'
			return number_to_phone(contato, pattern: /(\d{1,2})(\d{4})(\d{4})$/, area_code: true)
		elsif param == 'Email'
			return contato.contato
		else
			return "-"
		end
	end


	def pricipais_contatos(engajado)
		e = ""
		if engajado.contatos.principais.present?
			e << "<div>"
			engajado.contatos.principais.all.each do |c|
				e << "<p><em>#{c.t_contato.nome}: </em> #{ formata_contato(c.contato, param=c.t_contato.nome.to_s) }</p>"	
			end
			e << "</div>"
			return e.html_safe
		else
			return "-"
		end
	end

end
