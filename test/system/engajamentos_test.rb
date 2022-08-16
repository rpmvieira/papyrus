require "application_system_test_case"

class EngajamentosTest < ApplicationSystemTestCase
  setup do
    @engajamento = engajamentos(:one)
  end

  test "visiting the index" do
    visit engajamentos_url
    assert_selector "h1", text: "Engajamentos"
  end

  test "should create engajamento" do
    visit engajamentos_url
    click_on "New engajamento"

    fill_in "Engajado", with: @engajamento.engajado_id
    fill_in "Engajador", with: @engajamento.engajador_id
    fill_in "Engajamento", with: @engajamento.engajamento_id
    click_on "Create Engajamento"

    assert_text "Engajamento was successfully created"
    click_on "Back"
  end

  test "should update Engajamento" do
    visit engajamento_url(@engajamento)
    click_on "Edit this engajamento", match: :first

    fill_in "Engajado", with: @engajamento.engajado_id
    fill_in "Engajador", with: @engajamento.engajador_id
    fill_in "Engajamento", with: @engajamento.engajamento_id
    click_on "Update Engajamento"

    assert_text "Engajamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Engajamento" do
    visit engajamento_url(@engajamento)
    click_on "Destroy this engajamento", match: :first

    assert_text "Engajamento was successfully destroyed"
  end
end
