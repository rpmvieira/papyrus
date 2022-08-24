class EventoPolicy < ApplicationPolicy

  def evento_new?
    user.acesso_simples
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
