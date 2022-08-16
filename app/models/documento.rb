class Documento < ApplicationRecord

	belongs_to :documentavel, polymorphic: true
	belongs_to :t_documento

	validates :documentavel_id, :documentavel_type, :t_documento_id, :numero, presence: { message:"Não pode ficar em branco!" }


end
