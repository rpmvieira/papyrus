Usuario.finda_or_create_by!(:pessoa_id=>2,:email=>'sandra@teste.com',:password=>'123456')
Usuario.finda_or_create_by!(:pessoa_id=>1,:email=>'teste@teste.com',:password=>'123456')

30.times do |p|
pp = Pessoa.create!(:nome=>Faker::Name.name_with_middle,:cpf=>CPF.generate,:mae=>Faker::Name.name_with_middle,:nascimento=>Faker::Date.between(from: '1982-09-23', to: '2014-09-25'))
	Engajado.find_or_create_by!(:pessoa_id=>pp.id, :colaboracao_id=>1, :engajamento_id=>1)
pp.enderecos.find_or_create_by!(:logradouro=>"#{Faker::Address.street_suffix} #{Faker::Address.street_name}", :bairro=>Faker::Address.community, :numero=>Faker::Address.building_number, :cep=>Faker::Address.postcode, :municipio_id=>Municipio.find_by_nome('Macapa').id, :verificacao=>true, :verificacao_data=>DateTime.now, :verificacao_responsavel_id=> 1, :principal=> 'principal', :status=> 'criado')
end

# .strftime("%A, %d de %B de %Y, %H:%M h")
Engajamento.find_or_create_by!(:nome=>'Eleições 2022',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.first.id)
Engajamento.find_or_create_by(:nome=>'Eleições 2020',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.first.id)
Engajamento.find_or_create_by(:nome=>'Eleições 2018',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.first.id)
Engajamento.find_or_create_by(:nome=>'Eleições 2018',:descricao=>'Controle de Engajamento',:natureza_id=>1,:responsavel_id=>Pessoa.second.id)

Natureza.find_or_create_by(:nome=>'Eleição Oficial',:marcador=>'Eleição')
TColaboracao.find_or_create_by(:nome=>'Liderança',:natureza_id=>1,:descricao=>'-')

c1 = Colaboracao.find_or_create_by!(:colaborador_id=>Pessoa.first.id,:engajamento_id=>1,:t_colaboracao_id=>1,:status=>'ativo')
c2 = Colaboracao.find_or_create_by!(:colaborador_id=>Pessoa.first.id,:engajamento_id=>2,:t_colaboracao_id=>1,:status=>'ativo')
c3 = Colaboracao.find_or_create_by!(:colaborador_id=>Pessoa.second.id,:engajamento_id=>1,:t_colaboracao_id=>1,:status=>'ativo')






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