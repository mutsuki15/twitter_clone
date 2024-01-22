class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super do |resource|
      if resource.errors.any?
        flash[:alert] = t('devise.registrations.invalid')
      end
    end
  end
  

end