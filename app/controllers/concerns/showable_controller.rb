module ShowableController
  extend ActiveSupport::Concern

  module ClassMethods
    def show_resource(resource)
      render json: {
        :id => resource.id,
        :text => resource.text,
        :count => resource.count,
        :tweets => resource.tweets
      }      
    end
  end
end
