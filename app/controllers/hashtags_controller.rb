class HashtagsController < ApplicationController
  include StatableController::ClassMethods
  include SetableController::ClassMethods
  include ShowableController::ClassMethods

  before_action :set_hashtag, only: [:show]

  # GET /hashtags
  def index
    @hashtags = Hashtag.all

    render json: @hashtags
  end

  # GET /hashtags/1
  def show
    show_resource(@hashtag)
  end

  def stats
    get_stats(Hashtag)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      set_resource(Hashtag)
    end

    # Only allow a trusted parameter "white list" through.
    def hashtag_params
      params.require(:hashtag).permit(:text, :year)
    end
end
