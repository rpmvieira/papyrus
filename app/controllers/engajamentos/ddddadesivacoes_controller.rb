class Engajamentos::AdesivacoesController < ApplicationController
	before_action :set_engajamento, only: %i[ new create ]
	before_action :set_engajado, only: %i[ new create] 

	def new
		@adesivacao = @engajamento.adesivacoes.new
		render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/adesivacoes/adesivacao_form", locals: { adesivacao: @adesivacao }))
	end

	def create
	puts "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKllllllllllllll"
	end

	private

	def set_engajamento;@engajamento = Engajamento.find(params[:engajamento_id]);end
	def set_engajado;@engajado = Engajado.find(params[:engajado_id]);end
	def set_pessoa;@pessoa = @engajado.pessoa;end

	def pessoa_params
		params.require(:pessoa).permit(:nome, :apelido, :mae, :nascimento, :status )
	end

end
