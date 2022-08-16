class Endereco < ApplicationRecord

	belongs_to :enderecavel, polymorphic: true
	belongs_to :municipio
	has_one :estado, through: :municipio

	validates :enderecavel_id, :enderecavel_type, :logradouro, :bairro, :numero, :municipio_id, presence: { message:"Não pode ficar em branco!" }
	validates :enderecavel_id, uniqueness: { scope: [:enderecavel_type, :logradouro, :bairro, :municipio_id], message: "Já existe um registro com estas informações" }

	scope :principais, -> {where("enderecos.principal = true")}	

end
