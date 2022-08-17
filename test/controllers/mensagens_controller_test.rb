require "test_helper"

class MensagensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mensagem = mensagens(:one)
  end

  test "should get index" do
    get mensagens_url
    assert_response :success
  end

  test "should get new" do
    get new_mensagem_url
    assert_response :success
  end

  test "should create mensagem" do
    assert_difference("Mensagem.count") do
      post mensagens_url, params: { mensagem: { conteudo: @mensagem.conteudo, destinatario_id: @mensagem.destinatario_id, destinatario_type: @mensagem.destinatario_type, entregue: @mensagem.entregue, observacao: @mensagem.observacao } }
    end

    assert_redirected_to mensagem_url(Mensagem.last)
  end

  test "should show mensagem" do
    get mensagem_url(@mensagem)
    assert_response :success
  end

  test "should get edit" do
    get edit_mensagem_url(@mensagem)
    assert_response :success
  end

  test "should update mensagem" do
    patch mensagem_url(@mensagem), params: { mensagem: { conteudo: @mensagem.conteudo, destinatario_id: @mensagem.destinatario_id, destinatario_type: @mensagem.destinatario_type, entregue: @mensagem.entregue, observacao: @mensagem.observacao } }
    assert_redirected_to mensagem_url(@mensagem)
  end

  test "should destroy mensagem" do
    assert_difference("Mensagem.count", -1) do
      delete mensagem_url(@mensagem)
    end

    assert_redirected_to mensagens_url
  end
end
