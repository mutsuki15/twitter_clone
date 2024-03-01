module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if resource.errors.any?
          flash[:alert] = resource.errors.full_messages.join(', ')
        end
      end
    end
    protected
    
    def build_resource(hash = {})
      hash[:uid] = User.create_unique_string
      super
    end

    def update_resource(resource, params)
      return super if params[:password].present?

      resource.update_without_password(params.except('current_password'))
    end
  end
end
