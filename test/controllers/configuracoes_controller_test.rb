require "test_helper"

class ConfiguracoesControllerTest < ActionDispatch::IntegrationTest
  test "should get perfil" do
    get configuracoes_perfil_url
    assert_response :success
  end
end
