require "test_helper"

class WishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wish = wishes(:one)
  end

  test "should get index" do
    get wishes_url
    assert_response :success
  end

  test "should get new" do
    get new_wish_url
    assert_response :success
  end

  test "should create wish" do
    assert_difference('Wish.count') do
      post wishes_url, params: { wish: { budget_achieved: @wish.budget_achieved, budget_plan: @wish.budget_plan, description: @wish.description, goal_date: @wish.goal_date, nb_contributors: @wish.nb_contributors, nb_likes: @wish.nb_likes, privacy: @wish.privacy, title: @wish.title } }
    end

    assert_redirected_to wish_url(Wish.last)
  end

  test "should show wish" do
    get wish_url(@wish)
    assert_response :success
  end

  test "should get edit" do
    get edit_wish_url(@wish)
    assert_response :success
  end

  test "should update wish" do
    patch wish_url(@wish), params: { wish: { budget_achieved: @wish.budget_achieved, budget_plan: @wish.budget_plan, description: @wish.description, goal_date: @wish.goal_date, nb_contributors: @wish.nb_contributors, nb_likes: @wish.nb_likes, privacy: @wish.privacy, title: @wish.title } }
    assert_redirected_to wish_url(@wish)
  end

  test "should destroy wish" do
    assert_difference('Wish.count', -1) do
      delete wish_url(@wish)
    end

    assert_redirected_to wishes_url
  end
end
