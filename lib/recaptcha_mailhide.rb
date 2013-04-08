require 'recaptcha_mailhide/configuration'
require 'recaptcha_mailhide/encrypt'
require 'recaptcha_mailhide/url'
require 'recaptcha_mailhide/railtie' if defined?(Rails)

module RecaptchaMailhide
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
