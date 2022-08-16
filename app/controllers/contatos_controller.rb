class ContatosController < ApplicationController
	before_action :set_contato, only: %i[ edit update destroy ]

	def edit
		# @contatavel = Pessoa.find(params[:pessoa_id])
	end

	private

	def set_contato
		@contato = Contato.find(params[:id])
	end


end
