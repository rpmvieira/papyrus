json.extract! mensagem, :id, :destinatario_id, :destinatario_type, :conteudo, :entregue, :observacao, :created_at, :updated_at
json.url mensagem_url(mensagem, format: :json)
