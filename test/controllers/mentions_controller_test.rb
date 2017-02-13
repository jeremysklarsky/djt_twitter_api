require 'test_helper'

class MentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mention = mentions(:one)
  end

  test "should get index" do
    get mentions_url, as: :json
    assert_response :success
  end

  test "should create mention" do
    assert_difference('Mention.count') do
      post mentions_url, params: { mention: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mention" do
    get mention_url(@mention), as: :json
    assert_response :success
  end

  test "should update mention" do
    patch mention_url(@mention), params: { mention: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mention" do
    assert_difference('Mention.count', -1) do
      delete mention_url(@mention), as: :json
    end

    assert_response 204
  end
end
