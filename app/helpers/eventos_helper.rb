module EventosHelper


	def status_evento(status)
		cor = nil
		cor = 'gray' if status == 'ativo'
		cor = 'yellow' if status == 'agendado'
		cor = 'green' if status == 'confirmado'
		cor = 'red' if status == 'cancelado'

		template = "<span class='bg-#{cor}-200 text-#{cor}-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-#{cor}-700 dark:text-#{cor}-300'>#{status}</span>"
		return template.html_safe
	end

	def publico_previsao(publico)
		return "(sem estimativa de público)" if publico == 0
		return "(apenas #{publico} pessoa estimatimada)" if publico == 1
		return "(#{publico} pessoas estimatimadas)" if publico > 1
	end

end
