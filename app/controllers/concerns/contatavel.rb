module Contatavel
	extend ActiveSupport::Concern
	include ActionView::RecordIdentifier
	include RecordHelper

	def new
	end

	def create
		@contato = @contatavel.contatos.new(contato_params)

		respond_to do |format|
			if @contato.save
				contato = Contato.new
				redirect_to @contatavel, notice: 'Pessoa atualizada com sucesso.'
				format.turbo_stream {
					flash[:notice] = "Contato adicionado com sucesso."
				}
			else
				format.turbo_stream {
					render turbo_stream: turbo_stream.replace(dom_id_for_records(@contatavel, @contato), partial: "pessoas/contatos/newform", locals: { contato: @contato, contatavel: @contatavel})
				}
				format.html { redirect_to @contatavel }
			end
		end
	end

	private
	
	def contato_params
		params.require(:contato).permit(:t_contato_id, :contato, :preferencial, :observacao, :status )
	end
end
