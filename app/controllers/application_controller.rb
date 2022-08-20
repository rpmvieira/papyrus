class ApplicationController < ActionController::Base
	before_action :authenticate_usuario!
	include Pundit::Authorization


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
