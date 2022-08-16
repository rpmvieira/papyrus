class EngajamentosController < ApplicationController
  before_action :set_engajamento, only: %i[ show edit update destroy ]

  # GET /engajamentos or /engajamentos.json
  def index
    @engajamentos = Engajamento.all
  end

  def show
    if !@engajamento.responsavel?(current_usuario)
      @colaboracoes = @engajamento.colaboracoes
      @engajados = @engajamento.engajados
    elsif @engajamento.colaboracoes.deste_colaborador(current_usuario)
      @colaboracoes = @engajamento.colaboracoes.deste_colaborador(current_usuario)
      @engajados = @engajamento.engajados.deste_colaborador(current_usuario)
    end
  end

  # GET /engajamentos/new
  def new
    @engajamento = Engajamento.new
  end

  # GET /engajamentos/1/edit
  def edit
  end

  # POST /engajamentos or /engajamentos.json
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

  # PATCH/PUT /engajamentos/1 or /engajamentos/1.json
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

  # DELETE /engajamentos/1 or /engajamentos/1.json
  def destroy
    @engajamento.destroy

    respond_to do |format|
      format.html { redirect_to engajamentos_url, notice: "Engajamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engajamento
      @engajamento = Engajamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engajamento_params
      params.require(:engajamento).permit(:engajado_id, :engajamento_id, :engajador_id)
    end
  end
