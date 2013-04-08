require 'URL'
module RecaptchaMailhide
	module ViewHelpers
		def mailhide(email, options = {})
			URL.link_for email, options
		end
		def mailhide_url(email)
			URL.url_for email
		end
	end
end