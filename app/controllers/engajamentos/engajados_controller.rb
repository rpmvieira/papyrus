class Engajamentos::EngajadosController < ApplicationController
	include Contatos
	include Enderecos
	include ActionView::RecordIdentifier
	include RecordHelper
	
	before_action :set_engajamento, only: %i[ show contato_novo contato_create endereco_novo endereco_create new create engajado_new lideranca_create colaborador_new colaborador_create]
	before_action :set_engajado, only: %i[ show contato_novo contato_create endereco_novo endereco_create colaborador_new colaborador_create] # edit update destroy
	before_action :set_pessoa, only: %i[ ]

	def show;render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/engajados/show_engajado", locals: { engajado: @engajado }));end


	def engajado_new
		if @engajamento.lideranca?(current_usuario)
			@tipo = params[:tipo]
			@pessoa = Pessoa.new
			render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_lideranca_new", locals: { pessoa: @pessoa }))
		end
	end

	def lideranca_create
		if @engajamento.lideranca?(current_usuario)
			@colaboracao = @engajamento.lideranca?(current_usuario)
			@pessoa = Pessoa.new(pessoa_params)

			respond_to do |format|
				@engajados =  @engajamento.engajados.deste_colaborador(current_usuario).order(created_at: :desc)
				if @pessoa.save
					@pessoa.engajados.create(:colaboracao_id=>@colaboracao.colaborador_id,:lideranca=>true,:grupo_lideranca=>view_context.denominacao(@pessoa),:status=>'ativo')
					@pessoa = Pessoa.new
					format.turbo_stream {
						render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_show_inicio", locals: { engajados: @engajados} ))
						flash[:notice] = "Registro adicionado com sucesso."
					}
				else
					format.turbo_stream { 
						render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_lideranca_create_falha")) 
					}
					format.html { redirect_to @engajamento }
				end
			end
		else
			render( turbo_stream: turbo_stream.update("modal", partial: "shared/ops")) 
		end
	end

	def colaborador_new
		if @engajamento.lideranca?(current_usuario)
			@pessoa = Pessoa.new
			render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_colaborador_novo", locals: { pessoa: @pessoa, engajamento: @engajamento }))
		end
	end

	def colaborador_create
		puts "#{@engajado.id} kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
		if @engajamento.lideranca?(current_usuario)
			@engajado = Engajado.find(params[:engajado_id])
			@colaboracao = @engajamento.lideranca?(current_usuario)
			@pessoa = Pessoa.new(pessoa_params)

			respond_to do |format|
				@engajados =  @engajamento.engajados.deste_colaborador(current_usuario).order(created_at: :desc)
				if @pessoa.save
					@pessoa.engajados.create!(:colaboracao_id=>@colaboracao.colaborador_id,:ascendente_id=>@engajado.id,:status=>'ativo')
					# ,:ascendente_id=>@engajado
					@pessoa = Pessoa.new
					format.turbo_stream {
						# render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_show_inicio", locals: { engajados: @engajados} ))
						render( turbo_stream: turbo_stream.update("modal", partial: "shared/ops")) 
						flash[:notice] = "Registro adicionado com sucesso."
					}
				else
					format.turbo_stream { 
						render turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_colaborador_create_falha", locals: { pessoa: @pessoa, engajamento: @engajamento, engajados: @engajados })
					}
					format.html { redirect_to @engajamento }
				end
			end
		else
			render( turbo_stream: turbo_stream.update("flow", partial: "shared/ops")) 
		end
	end

	private

	def set_engajamento;@engajamento = Engajamento.find(params[:engajamento_id]);end
	def set_engajado;@engajado = Engajado.find(params[:engajado_id]);end
	def set_pessoa;@pessoa = @engajado.pessoa;end

	def pessoa_params
		params.require(:pessoa).permit(:nome, :apelido, :mae, :nascimento, :status )
	end

end
