class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :pessoa

  has_many :colaboracoes, through: :pessoa

  validates_uniqueness_of :pessoa_id, message: "Não pode ter mais de um utilizador"
  validates :pessoa_id, presence: true



  def possui_lideranca?(engajamento)
    self.colaboracoes.find_by_engajamento_id_and_t_colaboracao_id(engajamento.id,1)
  end

  def lideranca_ativa?(engajamento)
    if possui_lideranca?(engajamento) and possui_lideranca?(engajamento).status == "ativo"
      return true
    else
      return false
    end
  end

end
