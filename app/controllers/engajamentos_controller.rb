class EngajamentosController < ApplicationController
  include Adesivacoes
  before_action :set_engajamento, only: %i[ edit update destroy ]


  layout :resolve_layout


  def index
    authorize Engajamento
    @engajamentos = Engajamento.all
    # render( turbo_stream: turbo_stream.update("principal", partial: "engajamentos/turbo_stream/ts_index" ))

  end

  def cancelar
    @engajamento = Engajamento.find(params[:engajamento_id])
    puts "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
    # render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/turbo_stream/ts_cancelar" ))
    # render( turbo_stream: turbo_stream.update("modal", template: "engajamentos/cancelar" ))
  end


  def turbo_show
    # @engajamento = Engajamento.find(params[:id])
    # authorize @engajamento
    # if @engajamento.responsavel?(current_usuario)
    #   @coordenacoes = @engajamento.colaboracoes
    #   @liderancas = @engajamento.engajados.liderancas
    #   @colaboradores =  @engajamento.engajados.colaboradores.order(created_at: :desc)
    #   @eventos = @engajamento.eventos#.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario))
    #   @adesivacoes = @engajamento.adesivacoes
    # elsif @engajamento.colaboracoes.deste_colaborador(current_usuario)
    #   @adesivacoes = @engajamento.adesivacoes.deste_coordenador(@engajamento.coordenador?(current_usuario))
    #   @coordenacoes = @engajamento.colaboracoes.deste_colaborador(current_usuario)
    #   @liderancas = @engajamento.engajados.deste_colaborador(current_usuario).liderancas
    #   @colaboradores =  @engajamento.engajados.deste_colaborador(current_usuario).colaboradores.order(created_at: :desc)
    #   @eventos = @engajamento.eventos.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario)).order(inicio: :asc)
    # end
    render( turbo_stream: turbo_stream.update("principal", partial: "engajamentos/turbo_stream/ts_cancelar" ))
  end


  def show
    @engajamento = Engajamento.find(params[:id])
    authorize @engajamento
    if @engajamento.responsavel?(current_usuario)
      @coordenacoes = @engajamento.colaboracoes
      @liderancas = @engajamento.engajados.liderancas
      @colaboradores =  @engajamento.engajados.colaboradores.order(created_at: :desc)
      @eventos = @engajamento.eventos#.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario))
      @adesivacoes = @engajamento.adesivacoes
    elsif @engajamento.colaboracoes.deste_colaborador(current_usuario)
      @adesivacoes = @engajamento.adesivacoes.deste_coordenador(@engajamento.coordenador?(current_usuario))
      @coordenacoes = @engajamento.colaboracoes.deste_colaborador(current_usuario)
      @liderancas = @engajamento.engajados.deste_colaborador(current_usuario).liderancas
      @colaboradores =  @engajamento.engajados.deste_colaborador(current_usuario).colaboradores.order(created_at: :desc)
      @eventos = @engajamento.eventos.deste_responsavel_id(@engajamento.coordenadoria?(current_usuario)).order(inicio: :asc)
    end
    # render( turbo_stream: turbo_stream.update("principal", partial: "engajamentos/partials/conteudo/show_principal" ))
     # render( turbo_stream: turbo_stream.update("principal", template: "engajamentos/show" ))
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
    render( turbo_stream: turbo_stream.update("modal", partial: "engajamentos/partials/form/lideranca_new", locals: { pessoa: @pessoa }))
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


  def adesivacoes
    @engajamento = Engajamento.find(params[:engajamento_id])
    @adesivacoes = @engajamento.adesivacoes.deste_coordenador(@engajamento.coordenador?(current_usuario))
    render( turbo_stream: turbo_stream.update("show_inicio", template: "engajamentos/adesivacoes" ))
  end


  def resolve_layout
    case action_name
    when "show"
      'applicationd'
    else
      'application'
      # current_usuario ? "landing_page" : "publico"
    end
  end

  private
  def set_engajamento
    @engajamento = Engajamento.find(params[:engajamento_id])
  end

  def engajamento_params
    params.require(:engajamento).permit(:engajado_id, :engajamento_id, :engajador_id)
  end

  def pessoa_params
    params.require(:pessoa).permit(:nome, :apelido, :mae, :nascimento, :status )
  end
end
