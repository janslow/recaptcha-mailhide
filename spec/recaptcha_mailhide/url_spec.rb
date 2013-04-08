require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RecaptchaMailhide::URL do
  before do
    RecaptchaMailhide::Encrypt.stub(:encrypt).and_return("ABC")
  end

  describe ".url_for" do
    it("returns the proper URL") do
      RecaptchaMailhide::URL.url_for('foo@bar.com').should eq('http://www.google.com/recaptcha/mailhide/d?k=PUBLIC_KEY&c=ABC')
    end
  end

  describe ".link_for" do
  	it("returns an anchor tag with the proper URL") do
  		email = 'foo@bar.com'
      url = RecaptchaMailhide::URL.url_for(email)
  		RecaptchaMailhide::URL.link_for(email).should eq(
  			"<a href='#{url}' onclick=\"window.open('#{url}', '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300'); return false;\" title='Reveal this e-mail address'>...</a>")
  	end
    it("allows the content to be customised") do
      email = 'foo@bar.com'
      content ='lorem ipsum'
      url = RecaptchaMailhide::URL.url_for(email)
      RecaptchaMailhide::URL.link_for(email, :content => content).should eq(
        "<a href='#{url}' onclick=\"window.open('#{url}', '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300'); return false;\" title='Reveal this e-mail address'>#{content}</a>")
    end
    it("allows the title to be customised") do
      email = 'foo@bar.com'
      title ='Please click for encrypted email'
      url = RecaptchaMailhide::URL.url_for(email)
      RecaptchaMailhide::URL.link_for(email, :title => title).should eq(
        "<a href='#{url}' onclick=\"window.open('#{url}', '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300'); return false;\" title='#{title}'>...</a>")
    end
    it("allows a class to be added") do
      email = 'foo@bar.com'
      c ='mailhide_link'
      url = RecaptchaMailhide::URL.url_for(email)
      RecaptchaMailhide::URL.link_for(email, :class => c).should eq(
        "<a href='#{url}' onclick=\"window.open('#{url}', '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300'); return false;\" title='Reveal this e-mail address' class='#{c}'>...</a>")
    end
  end
end