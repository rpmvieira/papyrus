class ApplicationController < ActionController::Base
	include Pundit::Authorization

	before_action :authenticate_usuario!
	
  layout :determine_layout
  
  def determine_layout
    # if devise_controller?
    # "certificado"
    # case action_name
    # when "teste"
      # "evento_nao_logado"
    # else
      usuario_signed_in? ? "application" : "publico"
        # 'padrao'
      # else
        # 'publico'
      # end
      # current_usuario ? "landing_page" : "publicoo"
    # end
  end

  def pundit_user   
    current_usuario  
  end
  # def pundit_usuario
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #   @decoded = JsonWebToken.decode(header)
  #   Usuario.find(@decoded[:usuario_id])
  #   rescue ActiveRecord::RecordNotFound => e
  #     render json: { errors: e.message }, status: :unauthorized
  #   rescue JWT::DecodeError => e
  #     render json: { errors: e.message }, status: :unauthorized
  # end

end
