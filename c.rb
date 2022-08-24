Olho desabilitado =
"<button type='button' class='inline-flex items-center py-1 px-1 text-sm font-medium text-gray-900 bg-white rounded-l-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-blue-500 dark:focus:text-white cursor-not-allowed' disabled=''><svg xmlns='http://www.w3.org/2000/svg' class='h-6 w-6' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2'><path stroke-linecap='round' stroke-linejoin='round' d='M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21' /></svg></button>"


# Engajamento.find_or_create_by(:nome=>'Eleições 2020',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.first.id)
# Engajamento.find_or_create_by(:nome=>'Eleições 2018',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.first.id)
# Engajamento.find_or_create_by(:nome=>'Eleições 2018',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.second.id)







# TPredicativo.find_or_create_by(:nome=>'Registro de engajamento',:natureza_id=>1,:natureza=>true,:valor=>500)
# TPredicativo.find_or_create_by(:nome=>'Criação de usuário',:natureza_id=>1,:natureza=>true,:valor=>5)
# TPredicativo.find_or_create_by(:nome=>'Check in em evento',:natureza_id=>1,:natureza=>true,:valor=>5)
# TPredicativo.find_or_create_by(:nome=>'Documentação Nível 1',:natureza_id=>1,:natureza=>true,:valor=>5)
# t.boolean :verificacao, default: false
# t.integer :responsavel_id
# t.string :status


# Pessoa.find(1,2).each do |r|
# 	Engajamento.all.each do |e|
# 		Pessoa.all.limit(15).where.not(id: [1,2]).all.each do |p|
# 			e.colaboracoes.find_or_create_by(:colaborador_id=>r.id,:t_colaboracao_id=>1)
# 		end
# 	end
# end


Engajamento.all.each do |e|

Pessoa.all.limit(15).where.not(id: [1,2]).all.each do |p|
Engajado.find_or_create_by!(:pessoa_id=>p.id, :colaboracao_id=>1, :engajamento_id=>1)
p.enderecos.find_or_create_by!(:logradouro=>"#{Faker::Address.street_suffix} #{Faker::Address.street_name}", :bairro=>Faker::Address.community, :numero=>Faker::Address.building_number, :cep=>Faker::Address.postcode, :municipio_id=>Municipio.find_by_nome('Macapa').id, :verificacao=>true, :verificacao_data=>DateTime.now, :verificacao_responsavel_id=> 1, :principal=> 'principal', :status=> 'criado')
end


end
		Colaboracao.all.each do |c|
# 			c.participantes.create!(:partcipante_id=>p.id,:engajamento_id=>e.colaborador_id)
# 		end
end
end




 tipo_id: string, logradouro: string, bairro: string, numero: string, cep: string, complemento: string, municipio_id: integer, observacao: string, verificacao: boolean, verificacao_data: date, verificacao_responsavel_id: integer, status: string, created_at: datetime, updated_at: datetime)

Engajamento.find(1).engajados.limit(60).each do |e|
e.engajado.enderecos.find_or_create_by!(:logradouro=>"#{Faker::Address.street_suffix} #{Faker::Address.street_name}", :bairro=>Faker::Address.community, :numero=>Faker::Address.building_number, :cep=>Faker::Address.postcode, :municipio_id=>Municipio.find_by_nome('Macapa').id, :verificacao=>true, :verificacao_data=>DateTime.now, :verificacao_responsavel_id=> 1, :principal=> 'principal', :status=> 'criado')
end