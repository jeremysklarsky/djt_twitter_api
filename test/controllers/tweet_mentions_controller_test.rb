require 'test_helper'

class TweetMentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet_mention = tweet_mentions(:one)
  end

  test "should get index" do
    get tweet_mentions_url, as: :json
    assert_response :success
  end

  test "should create tweet_mention" do
    assert_difference('TweetMention.count') do
      post tweet_mentions_url, params: { tweet_mention: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show tweet_mention" do
    get tweet_mention_url(@tweet_mention), as: :json
    assert_response :success
  end

  test "should update tweet_mention" do
    patch tweet_mention_url(@tweet_mention), params: { tweet_mention: {  } }, as: :json
    assert_response 200
  end

  test "should destroy tweet_mention" do
    assert_difference('TweetMention.count', -1) do
      delete tweet_mention_url(@tweet_mention), as: :json
    end

    assert_response 204
  end
end
