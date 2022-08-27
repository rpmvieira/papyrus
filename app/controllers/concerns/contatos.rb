module Contatos
	extend ActiveSupport::Concern
	include ActionView::RecordIdentifier
	include RecordHelper

	def contato_novo
		@pessoa = @engajado.pessoa
		@contato = @pessoa.contatos.new
		render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/partials/form/contato_novo", locals: { pessoa: @pessoa }))
		# render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/new/ts_lideranca_new", locals: { pessoa: @pessoa }))
	end


	def contato_create
		@pessoa = @engajado.pessoa
		@contato = @pessoa.contatos.new(contato_params)
		respond_to do |format|
			if @contato.save
				@contato_salvo = @contato
				@contato = Contato.new
				format.turbo_stream {
					render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/create/ts_contato_create_sucesso")) 
					flash[:notice] = "Registro adicionado com sucesso."
				}
			else
				format.turbo_stream { 
					render turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/create/ts_contato_create_falha", locals: { engajado: @engajado, pessoa: @pessoa })
					# render turbo_stream: turbo_stream.update("flow", partial: "shared/ops")
				}
				format.html { redirect_to @engajamento }
			end
		end
	end

	private

	def contato_params;		params.require(:contato).permit(:t_contato_id, :contato, :principal, :observacao, :status );	end

end
