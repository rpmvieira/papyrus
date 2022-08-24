module Enderecos
	extend ActiveSupport::Concern
	include ActionView::RecordIdentifier
	include RecordHelper

	def endereco_novo
		@pessoa = @engajado.pessoa
		@endereco = @pessoa.enderecos.new
		render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/partials/form/endereco_novo", locals: { pessoa: @pessoa }))
	end


	def endereco_create
		@pessoa = @engajado.pessoa
		@endereco = @pessoa.enderecos.new(endereco_params)
		respond_to do |format|
			if @endereco.save
				@endereco_salvo = @endereco
				@endereco = Endereco.new
				format.turbo_stream {
					render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/create/ts_endereco_create_sucesso")) 
					flash[:notice] = "Registro adicionado com sucesso."
				}
			else
				format.turbo_stream { 
					render turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/create/ts_endereco_create_falha", locals: { engajado: @engajado, pessoa: @pessoa, engajamento: @engajamento, engajados: @engajados })
				}
				format.html { redirect_to @engajamento }
			end
		end
	end

	private

	def endereco_params
		params.require(:endereco).permit(:logradouro, :bairro, :numero, :municipio_id, :principal, :status )
	end

end
