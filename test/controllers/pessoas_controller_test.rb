require "test_helper"

class PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa = pessoas(:one)
  end

  test "should get index" do
    get pessoas_url
    assert_response :success
  end

  test "should get new" do
    get new_pessoa_url
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference("Pessoa.count") do
      post pessoas_url, params: { pessoa: { cpf: @pessoa.cpf, est_civil_id: @pessoa.est_civil_id, etnia_id: @pessoa.etnia_id, mae: @pessoa.mae, nacionalidade_id: @pessoa.nacionalidade_id, nascimento: @pessoa.nascimento, naturalidade_id: @pessoa.naturalidade_id, nome: @pessoa.nome, sexo_id: @pessoa.sexo_id, status: @pessoa.status, t_sanguinea_id: @pessoa.t_sanguinea_id, verificacao: @pessoa.verificacao, verificacao_data: @pessoa.verificacao_data, verificacao_responsavel_id: @pessoa.verificacao_responsavel_id } }
    end

    assert_redirected_to pessoa_url(Pessoa.last)
  end

  test "should show pessoa" do
    get pessoa_url(@pessoa)
    assert_response :success
  end

  test "should get edit" do
    get edit_pessoa_url(@pessoa)
    assert_response :success
  end

  test "should update pessoa" do
    patch pessoa_url(@pessoa), params: { pessoa: { cpf: @pessoa.cpf, est_civil_id: @pessoa.est_civil_id, etnia_id: @pessoa.etnia_id, mae: @pessoa.mae, nacionalidade_id: @pessoa.nacionalidade_id, nascimento: @pessoa.nascimento, naturalidade_id: @pessoa.naturalidade_id, nome: @pessoa.nome, sexo_id: @pessoa.sexo_id, status: @pessoa.status, t_sanguinea_id: @pessoa.t_sanguinea_id, verificacao: @pessoa.verificacao, verificacao_data: @pessoa.verificacao_data, verificacao_responsavel_id: @pessoa.verificacao_responsavel_id } }
    assert_redirected_to pessoa_url(@pessoa)
  end

  test "should destroy pessoa" do
    assert_difference("Pessoa.count", -1) do
      delete pessoa_url(@pessoa)
    end

    assert_redirected_to pessoas_url
  end
end
