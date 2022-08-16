require "test_helper"

class EngajamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @engajamento = engajamentos(:one)
  end

  test "should get index" do
    get engajamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_engajamento_url
    assert_response :success
  end

  test "should create engajamento" do
    assert_difference("Engajamento.count") do
      post engajamentos_url, params: { engajamento: { engajado_id: @engajamento.engajado_id, engajador_id: @engajamento.engajador_id, engajamento_id: @engajamento.engajamento_id } }
    end

    assert_redirected_to engajamento_url(Engajamento.last)
  end

  test "should show engajamento" do
    get engajamento_url(@engajamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_engajamento_url(@engajamento)
    assert_response :success
  end

  test "should update engajamento" do
    patch engajamento_url(@engajamento), params: { engajamento: { engajado_id: @engajamento.engajado_id, engajador_id: @engajamento.engajador_id, engajamento_id: @engajamento.engajamento_id } }
    assert_redirected_to engajamento_url(@engajamento)
  end

  test "should destroy engajamento" do
    assert_difference("Engajamento.count", -1) do
      delete engajamento_url(@engajamento)
    end

    assert_redirected_to engajamentos_url
  end
end
