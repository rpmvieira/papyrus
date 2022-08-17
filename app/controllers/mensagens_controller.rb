class MensagensController < ApplicationController
  before_action :set_mensagem, only: %i[ show edit update destroy ]

  # GET /mensagens or /mensagens.json
  def index
    @mensagens = Mensagem.all
  end

  # GET /mensagens/1 or /mensagens/1.json
  def show
  end

  # GET /mensagens/new
  def new
    @mensagem = Mensagem.new
  end

  # GET /mensagens/1/edit
  def edit
  end

  # POST /mensagens or /mensagens.json
  def create
    @mensagem = Mensagem.new(mensagem_params)

    respond_to do |format|
      if @mensagem.save
        format.html { redirect_to mensagem_url(@mensagem), notice: "Mensagem was successfully created." }
        format.json { render :show, status: :created, location: @mensagem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagens/1 or /mensagens/1.json
  def update
    respond_to do |format|
      if @mensagem.update(mensagem_params)
        format.html { redirect_to mensagem_url(@mensagem), notice: "Mensagem was successfully updated." }
        format.json { render :show, status: :ok, location: @mensagem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagens/1 or /mensagens/1.json
  def destroy
    @mensagem.destroy

    respond_to do |format|
      format.html { redirect_to mensagens_url, notice: "Mensagem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagem
      @mensagem = Mensagem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mensagem_params
      params.require(:mensagem).permit(:destinatario_id, :destinatario_type, :conteudo, :entregue, :observacao)
    end
end
