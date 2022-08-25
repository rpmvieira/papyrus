class EngajamentosController < ApplicationController
  before_action :set_engajamento, only: %i[ show edit update destroy ]

  def index
    authorize Engajamento
    @engajamentos = Engajamento.all
  end

  def show
    authorize @engajamento

    if @engajamento.responsavel?(current_usuario)
      @colaboracoes = @engajamento.colaboracoes
      @engajados = @engajamento.engajados.liderancas
      @eventos = @engajamento.eventos#.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario))
    elsif @engajamento.colaboracoes.deste_colaborador(current_usuario)
      @colaboracoes = @engajamento.colaboracoes.deste_colaborador(current_usuario)
      @engajados = @engajamento.engajados.deste_colaborador(current_usuario).liderancas
      @eventos = @engajamento.eventos.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario)).order(inicio: :asc)
    end
  end

  def new;@engajamento = Engajamento.new;end

  def edit;end

  def create
    @engajamento = Engajamento.new(engajamento_params)

    respond_to do |format|
      if @engajamento.save
        format.html { redirect_to engajamento_url(@engajamento), notice: "Engajamento was successfully created." }
        format.json { render :show, status: :created, location: @engajamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engajamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @engajamento.update(engajamento_params)
        format.html { redirect_to engajamento_url(@engajamento), notice: "Engajamento was successfully updated." }
        format.json { render :show, status: :ok, location: @engajamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engajamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @engajamento.destroy

    respond_to do |format|
      format.html { redirect_to engajamentos_url, notice: "Engajamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def lideranca_new
    @engajamento = Engajamento.find(params[:engajamento_id])
    authorize @engajamento
    @tipo = params[:tipo]
    @pessoa = Pessoa.new
    render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/new/ts_lideranca_new", locals: { pessoa: @pessoa }))
  end

  def lideranca_create
    @engajamento = Engajamento.find(params[:engajamento_id])

    @colaboracao = @engajamento.coordenador?(current_usuario)
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      @engajados =  @engajamento.engajados.deste_colaborador(current_usuario).liderancas.order(created_at: :desc)
      if @pessoa.save
        @engajado = @pessoa.engajados.create(colaboracao_id: @colaboracao.id, lideranca: true, grupo_lideranca: view_context.denominacao(@pessoa), status: "ativo" )
        @pessoa = Pessoa.new
        format.turbo_stream {
          render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/create/ts_lideranca_create_sucesso", locals: { engajados: @engajados} ))
          flash[:notice] = "Registro adicionado com sucesso."
        }
      else
        format.turbo_stream { 
          render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/create/ts_lideranca_create_falha")) 
        }
        format.html { redirect_to @engajamento }
      end
    end
  end



  private
  def set_engajamento
    @engajamento = Engajamento.find(params[:id])
  end

  def engajamento_params
    params.require(:engajamento).permit(:engajado_id, :engajamento_id, :engajador_id)
  end

  def pessoa_params
    params.require(:pessoa).permit(:nome, :apelido, :mae, :nascimento, :status )
  end
end
