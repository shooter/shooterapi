class Notification < ActionMailer::Base

  def notification(shooter)
    setup_email
    subject "Shooter Notification"
    recipients shooter.user.email
    sent_on Time.now
    body :shooter => shooter
  end

  def setup_email
    from "Shooter <noreply@shooter.heroku.com>"
  end
  

end
