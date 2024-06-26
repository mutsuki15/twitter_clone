# frozen_string_literal: true

module Users
  class Mailer < Devise::Mailer
    def headers_for(action, opts)
      super.merge!(template_path: 'users/mailer')
    end
  end
end
