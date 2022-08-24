class EngajamentoPolicy < ApplicationPolicy

  def index?
    user.acesso_total? || user.acesso_simples #|| user.id == 2
  end

  def show?
    record.acesso_visualizacao(user)
  end

  def lideranca_new?
    record.coordenador?(user)
  end

  def lideranca_create?
    record.coordenador?(user)
  end

  # - if policy(@project).create?
    class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
