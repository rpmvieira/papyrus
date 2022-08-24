class ApplicationController < ActionController::Base
	include Pundit::Authorization

	before_action :authenticate_usuario!
	

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
