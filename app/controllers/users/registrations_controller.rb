# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        flash[:alert] = t('devise.registrations.invalid') if resource.errors.any?
      end
    end
  end
end
