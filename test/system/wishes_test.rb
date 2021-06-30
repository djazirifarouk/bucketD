require "application_system_test_case"

class WishesTest < ApplicationSystemTestCase
  setup do
    @wish = wishes(:one)
  end

  test "visiting the index" do
    visit wishes_url
    assert_selector "h1", text: "Wishes"
  end

  test "creating a Wish" do
    visit wishes_url
    click_on "New Wish"

    fill_in "Budget achieved", with: @wish.budget_achieved
    fill_in "Budget plan", with: @wish.budget_plan
    fill_in "Description", with: @wish.description
    fill_in "Goal date", with: @wish.goal_date
    fill_in "Nb contributors", with: @wish.nb_contributors
    fill_in "Nb likes", with: @wish.nb_likes
    check "Privacy" if @wish.privacy
    fill_in "Title", with: @wish.title
    click_on "Create Wish"

    assert_text "Wish was successfully created"
    click_on "Back"
  end

  test "updating a Wish" do
    visit wishes_url
    click_on "Edit", match: :first

    fill_in "Budget achieved", with: @wish.budget_achieved
    fill_in "Budget plan", with: @wish.budget_plan
    fill_in "Description", with: @wish.description
    fill_in "Goal date", with: @wish.goal_date
    fill_in "Nb contributors", with: @wish.nb_contributors
    fill_in "Nb likes", with: @wish.nb_likes
    check "Privacy" if @wish.privacy
    fill_in "Title", with: @wish.title
    click_on "Update Wish"

    assert_text "Wish was successfully updated"
    click_on "Back"
  end

  test "destroying a Wish" do
    visit wishes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wish was successfully destroyed"
  end
end
