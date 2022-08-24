class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :pessoa

  has_many :colaboracoes, through: :pessoa

  validates_uniqueness_of :pessoa_id, message: "Não pode ter mais de um utilizador"
  validates :pessoa_id, presence: true

  def acesso_total?
    begin
      return colaboracoes.find_by_t_colaboracao_id(TColaboracao.find_by_nome("GodMode").id)
    rescue Exception => e
      return nil
    end
  end

  def coordenador_geral?
    begin
      return colaboracoes.find_by_t_colaboracao_id(TColaboracao.find_by_nome("Coordenação Geral").id)
    rescue Exception => e
      return nil
    end
  end

  def coordenador?
    begin
      return colaboracoes.find_by_t_colaboracao_id(TColaboracao.find_by_nome("Coordenação").id)
    rescue Exception => e
      return nil
    end
  end

  def acesso_simples
    coordenador_geral? || coordenador?
  end

  # def possui_lideranca?(engajamento)
  #   self.colaboracoes.find_by_engajamento_id_and_t_colaboracao_id(engajamento.id,TColaboracao.find_by_nome("Coordenação").id)
  # end

  # def lideranca_ativa?(engajamento)
  #   if possui_lideranca?(engajamento) and possui_lideranca?(engajamento).status == "ativo"
  #     return true
  #   else
  #     return false
  #   end
  # end

end
