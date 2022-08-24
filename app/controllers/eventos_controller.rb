class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]
  before_action :set_engajamento, only: %i[ evento_new evento_create eventos_dia show edit update] #show edit update destroy ]

  def index
    @eventos = Evento.all
  end

  def show
  end

  def evento_new
    @evento = @engajamento.eventos.new
    authorize @evento
    render( turbo_stream: turbo_stream.update("modal", partial: "eventos/turbo_stream/new/ts_evento_new" ))
  end

  def edit
    render( turbo_stream: turbo_stream.update("modal", partial: "eventos/form_update", locals: { evento: @evento } ))
  end

  def evento_create
    @colaboracao = @engajamento.coordenador?(current_usuario)
    @evento = @engajamento.eventos.new(evento_params)
    
    respond_to do |format|
      if @evento.save
        @evento_salvo = @evento
        @eventos = @engajamento.eventos.order(inicio: :asc)
        @evento = @engajamento.eventos.new
        format.turbo_stream {
          render( turbo_stream: turbo_stream.update("modal", partial: "eventos/turbo_stream/create/ts_evento_create_sucesso", locals: { evento: @evento_salvo } ))
        }
      else
        format.turbo_stream { 
          render( turbo_stream: turbo_stream.update("modal", partial: "eventos/turbo_stream/create/ts_evento_create_falha")) 
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @evento.update(evento_params)
        @eventos = @engajamento.eventos.order(inicio: :asc)
        format.turbo_stream { render( turbo_stream: turbo_stream.update("modal", partial: "eventos/turbo_stream/crud/ts_update_sucesso")) }
      else
        format.turbo_stream { render( turbo_stream: turbo_stream.update("modal", partial: "eventos/turbo_stream/crud/ts_update_falha")) }
      end
    end
  end

  def eventos_dia
    if params[:evento_dia][:referencia].present?
      @referencia = params[:evento_dia][:referencia]
      @eventos_dia = @engajamento.eventos.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario)).inicio_on_day(@referencia)
      render( turbo_stream: turbo_stream.update("modal", partial: "eventos/turbo_stream/conteudo/ts_evento_dia", locals: { eventos_dia: @eventos_dia, referencia: @referencia })) 
    else
      puts "ops"
    end
  end

  def destroy
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to eventos_url, notice: "Evento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_evento;@evento = Evento.find(params[:evento_id]);end
  def evento_params;params.require(:evento).permit(:engajamento_id, :responsavel_id, :nome, :descricao, :inicio, :termino, :local, :publico_previsao, :publico_confirmado, :status);end
  def set_engajamento;@engajamento = Engajamento.find(params[:engajamento_id]);end
end
