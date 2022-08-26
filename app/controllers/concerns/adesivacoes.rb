module Adesivacoes
	extend ActiveSupport::Concern
	include ActionView::RecordIdentifier
	include RecordHelper


	def adesivacao_nova
		@colaboracao = @engajamento.coordenador?(current_usuario)
		@adesivacao = @engajamento.adesivacoes.new
		render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/adesivacoes/adesivacao_form", locals: { adesivacao: @adesivacao }))
	end


	def adesivacao_create
		@colaboracao = @engajamento.coordenador?(current_usuario)
		@adesivacao = @engajamento.adesivacoes.new(adesivacao_params)
		respond_to do |format|
			if @adesivacao.save
				@adesivacao_salva = @adesivacao
				@adesivacao = @engajamento.adesivacoes.new
				format.turbo_stream {
					render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/adesivacoes/ts_adesivacao_create_sucesso", locals: { adesivacao_salva: @adesivacao_salva})) 
				}
			else
				format.turbo_stream { 
					render turbo_stream: turbo_stream.update("modal", partial: "engajamentos/adesivacoes/ts_adesivacao_create_falha", locals: { adesivacao: @adesivacao })
				}
			end
		end
	end

	private

	def adesivacao_params;		params.require(:adesivacao).permit(:responsavel_id, :engajamento_id, :engajado_id, :tipo_id, :placa, :status );	end

end
