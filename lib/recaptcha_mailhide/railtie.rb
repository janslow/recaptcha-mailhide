require 'recaptcha_mailhide/view_helpers'
module RecaptchaMailhide
  class Railtie < Rails::Railtie
    initializer "recaptcha_mailhide.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end