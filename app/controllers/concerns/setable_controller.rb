module SetableController
  extend ActiveSupport::Concern

  module ClassMethods
    def set_resource(klass)
      name = klass.name.downcase
      begin
        instance_variable_set("@#{name}", klass.find(params[:id]))
      rescue ActiveRecord::RecordNotFound
        instance_variable_set("@#{name}", klass.find_by(:text => params[:id]))
      end
    end
  end
end
