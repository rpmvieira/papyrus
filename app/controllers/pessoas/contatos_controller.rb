class Pessoas::ContatosController < ApplicationController
	include Contatavel

	before_action :set_contatavel

	def edit
		@contatavel = Pessoa.find(params[:pessoa_id])		
		@contato = Contato.find(params[:id])
		puts "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
	end

	private

	def set_contatavel
		@contatavel = Pessoa.find(params[:pessoa_id])		
	end

end
