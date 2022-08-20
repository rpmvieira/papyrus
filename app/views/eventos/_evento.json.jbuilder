json.extract! evento, :id, :engajamento_id, :responsavel_id, :nome, :descricao, :inicio, :termino, :local, :status, :created_at, :updated_at
json.url evento_url(evento, format: :json)
