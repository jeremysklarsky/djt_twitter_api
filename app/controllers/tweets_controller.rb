class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show]

  # GET /tweets
  def index

    @tweets = Tweet.where(nil) if !filtering_params(params).empty?

    # e.g. @tweets = @tweets.by_mention(params[:mention]) if params[:mention].present?
    filtering_params(params).each do |key, value|
      @tweets = @tweets.public_send("by_" + key, value) if value.present?
    end    

    if params[:between].present?
      dates = Dates.split_dates(params[:between])
      @tweets = @tweets.by_time_period(dates.first, dates.last) 
    end

    if filtering_params(params).empty?
      render json: {
        status:"400",
        error: "Bad Request. Tweets cannot be loaded without at least one filtering option " +
               "(e.g. /tweets&mention=BarackObama)"}
    else
      render json: {
        count: @tweets.size,
        tweets: @tweets
      }
    end
  end

  # GET /tweets/1
  def show
    render json: @tweet
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.fetch(:tweet, {})
    end

    def filtering_params(params)
      params.slice(:mention, :word, :hashtag, :phrase, :text, :year)
    end    
end
