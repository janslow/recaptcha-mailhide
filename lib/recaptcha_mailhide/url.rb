module RecaptchaMailhide
  module URL
    BASE_URL = "http://www.google.com/recaptcha/mailhide/d"

    def self.url_for(email)
      public_key = RecaptchaMailhide.configuration.public_key
      encrypted_email = RecaptchaMailhide::Encrypt.encrypt(email)
      BASE_URL + "?k=#{public_key}&c=#{encrypted_email}"
    end

    def self.link_for(email, options = {})
    	url = url_for(email)
    	content = options[:content] || '...'
    	title = options[:title] || 'Reveal this e-mail address'
      other = ''
      other += " class='#{options[:class]}'" if options[:class]
      
    	onclick = "window.open('#{url}', '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300'); return false;"
    	"<a href='#{url}' onclick=\"#{onclick}\" title='#{title}'#{other}>#{content}</a>"
    end
  end
end
