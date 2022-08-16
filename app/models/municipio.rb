class Municipio < ApplicationRecord

	belongs_to :estado
	has_many :naturalidades, class_name: "Pessoa", :foreign_key => "naturalidade_id"

	validates :nome, :estado_id, presence: { message:"Não pode ficar em branco!" }

end
