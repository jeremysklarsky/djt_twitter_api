module StatableController
  extend ActiveSupport::Concern

  module ClassMethods
    def get_stats(klass)
      if params[:top].present? && params[:between].present?
        dates = params[:between].split(",").collect{|date|Dates.clean(date)}
        start = dates[0]
        finish = dates[1]
        @hash = klass.top_by_time_period(start, finish, params[:top].to_i)
      end
      
      @hash = klass.top(params[:top].to_i) if params[:top].present? && !params[:year].present? && !params[:between].present?
      @hash = klass.top_by_year(params[:year].to_i, params[:top].to_i) if params[:top].present? && params[:year].present?
      render json: @hash
    end
  end
end