require "test_helper"

class ConteudoControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get conteudo_home_url
    assert_response :success
  end

  test "should get sobre" do
    get conteudo_sobre_url
    assert_response :success
  end

  test "should get notas" do
    get conteudo_notas_url
    assert_response :success
  end
end
