class Notifier < ActionMailer::Base

  def signup_newsletter(recipient, newsletter)
    puts '*'*80
    puts newsletter.content
    
    recipients   recipient.email
    subject      newsletter.title
    from         "acosferreira@gmail.com"
    body          newsletter.content
    content_type "text/html"
  end
end
