class MentionsController < ApplicationController
  include StatableController::ClassMethods
  include SetableController::ClassMethods
  include ShowableController::ClassMethods
  before_action :set_mention, only: [:show]
  

  # GET /mentions
  def index
    @mentions = Mention.all

    render json: @mentions
  end

  # GET /mentions/1
  def show
    show_resource(@mention)
  end

  def stats
    get_stats(Mention)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mention
      set_resource(Mention)
    end

    # Only allow a trusted parameter "white list" through.
    def mention_params
      params.fetch(:mention, {})
    end
end
