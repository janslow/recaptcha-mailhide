require 'my_gem/view_helpers'
module MyGem
  class Railtie < Rails::Railtie
    initializer "recaptcha_mailhide.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end