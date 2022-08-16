class Contato < ApplicationRecord

	belongs_to :contatavel, polymorphic: true
	belongs_to :t_contato

	validates :contatavel_id, :contatavel_type, :t_contato_id, :contato, presence: { message:"não pode ficar em branco!" }
	validates :contatavel_id, uniqueness: { scope: [:contatavel_type, :t_contato_id, :contato], message: "Já existe um registro com estas informações" }

	
	validates :contato, length: { is: 11, message: "Celular deve ter 11 digitos. Padrão '(00) 00000-0000'" }, :if => Proc.new {|f| f.t_contato_id == 1 }
	validates :contato, length: { is: 10, message: "Contato fixo deve ter 10 digitos. Padrão '(00) 0000-0000'" }, :if => Proc.new {|f| f.t_contato_id == 2 }
	validates :contato, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "A informação preenchida não é válida" }, :if => Proc.new {|f| f.t_contato_id == 3 }
	validates :contato, numericality: { only_integer: true, message: "Este campo só aceita números" }, :unless => Proc.new {|f| f.t_contato_id == 3 }

	scope :principais, -> {where("contatos.principal = true")}
	scope :deste_t_contato,lambda{|t_contato_id| where("t_contato_id = ?",t_contato_id)}

	# validate :formato_contato

	# def formato_contato#(record)
	# 	if t_contato_id == 1
	# 		if contato.length != 11
	# 			errors.add :contato, "Celular deve ter 11 digitos. Padrão '(00) 00000-0000'" #unless t_contato_id == 1 && contato.length != 11
	# 		end
	# 	elsif t_contato_id == 2
	# 		if contato.length != 10
	# 			errors.add :contato, "Contato fixo deve ter 10 digitos. Padrão '(00) 0000-0000'"	
	# 		end
	# 	end
	# end


end
