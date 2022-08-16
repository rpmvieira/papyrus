require "application_system_test_case"

class PessoasTest < ApplicationSystemTestCase
  setup do
    @pessoa = pessoas(:one)
  end

  test "visiting the index" do
    visit pessoas_url
    assert_selector "h1", text: "Pessoas"
  end

  test "should create pessoa" do
    visit pessoas_url
    click_on "New pessoa"

    fill_in "Cpf", with: @pessoa.cpf
    fill_in "Est civil", with: @pessoa.est_civil_id
    fill_in "Etnia", with: @pessoa.etnia_id
    fill_in "Mae", with: @pessoa.mae
    fill_in "Nacionalidade", with: @pessoa.nacionalidade_id
    fill_in "Nascimento", with: @pessoa.nascimento
    fill_in "Naturalidade", with: @pessoa.naturalidade_id
    fill_in "Nome", with: @pessoa.nome
    fill_in "Sexo", with: @pessoa.sexo_id
    fill_in "Status", with: @pessoa.status
    fill_in "T sanguinea", with: @pessoa.t_sanguinea_id
    check "Verificacao" if @pessoa.verificacao
    fill_in "Verificacao data", with: @pessoa.verificacao_data
    fill_in "Verificacao responsavel", with: @pessoa.verificacao_responsavel_id
    click_on "Create Pessoa"

    assert_text "Pessoa was successfully created"
    click_on "Back"
  end

  test "should update Pessoa" do
    visit pessoa_url(@pessoa)
    click_on "Edit this pessoa", match: :first

    fill_in "Cpf", with: @pessoa.cpf
    fill_in "Est civil", with: @pessoa.est_civil_id
    fill_in "Etnia", with: @pessoa.etnia_id
    fill_in "Mae", with: @pessoa.mae
    fill_in "Nacionalidade", with: @pessoa.nacionalidade_id
    fill_in "Nascimento", with: @pessoa.nascimento
    fill_in "Naturalidade", with: @pessoa.naturalidade_id
    fill_in "Nome", with: @pessoa.nome
    fill_in "Sexo", with: @pessoa.sexo_id
    fill_in "Status", with: @pessoa.status
    fill_in "T sanguinea", with: @pessoa.t_sanguinea_id
    check "Verificacao" if @pessoa.verificacao
    fill_in "Verificacao data", with: @pessoa.verificacao_data
    fill_in "Verificacao responsavel", with: @pessoa.verificacao_responsavel_id
    click_on "Update Pessoa"

    assert_text "Pessoa was successfully updated"
    click_on "Back"
  end

  test "should destroy Pessoa" do
    visit pessoa_url(@pessoa)
    click_on "Destroy this pessoa", match: :first

    assert_text "Pessoa was successfully destroyed"
  end
end
