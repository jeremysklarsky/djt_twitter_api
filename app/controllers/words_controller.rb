class WordsController < ApplicationController
  include StatableController::ClassMethods
  include SetableController::ClassMethods
  include ShowableController::ClassMethods
  
  before_action :set_word, only: [:show]
  # GET /words
  def index
    @words = Word.all

    render json: @words
  end

  # GET /words/1
  def show
    show_resource(@word)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      set_resource(Word)      
    end

    # Only allow a trusted parameter "white list" through.
    def word_params
      params.fetch(:word, {}).permit(:top, :year)
    end
end
