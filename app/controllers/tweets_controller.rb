class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show]

  # GET /tweets
  def index

    if params[:mention]
      @tweets = Tweet.by_mention(params[:mention])
    elsif params[:word]
      @tweets = Tweet.by_word(params[:word])
    elsif params[:hashtag]
      @tweets = Tweet.by_hashtag(params[:hashtag])
    elsif params[:phrase]
      @tweets = Tweet.by_phrase(params[:phrase])
    else
      @tweets = Tweet.all
    end

    if params[:year]
      @tweets = @tweets.by_year(params[:year].to_i)
    elsif params[:between]
      dates = Dates.split_dates(params[:between])
      @tweets = @tweets.by_time_period(dates.first, dates.last) 
    end
    
    if params[:text]
      @tweets = @tweets.select{|t| t.text.include?(params[:text])}
    end

    render json: @tweets
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
end
