require "application_system_test_case"

class CategoriaTest < ApplicationSystemTestCase
  setup do
    @categoria = categoria(:one)
  end

  test "visiting the index" do
    visit categoria_url
    assert_selector "h1", text: "Categoria"
  end

  test "should create categoria" do
    visit categoria_url
    click_on "New categoria"

    fill_in "Name", with: @categoria.name
    click_on "Create Categoria"

    assert_text "Categoria was successfully created"
    click_on "Back"
  end

  test "should update Categoria" do
    visit categoria_url(@categoria)
    click_on "Edit this categoria", match: :first

    fill_in "Name", with: @categoria.name
    click_on "Update Categoria"

    assert_text "Categoria was successfully updated"
    click_on "Back"
  end

  test "should destroy Categoria" do
    visit categoria_url(@categoria)
    click_on "Destroy this categoria", match: :first

    assert_text "Categoria was successfully destroyed"
  end
end
