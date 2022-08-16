json.extract! pessoa, :id, :nome, :cpf, :mae, :nascimento, :sexo_id, :t_sanguinea_id, :etnia_id, :est_civil_id, :nacionalidade_id, :naturalidade_id, :verificacao, :verificacao_data, :verificacao_responsavel_id, :status, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
