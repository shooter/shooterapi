class Notification < ActionMailer::Base

  def notification(shooter)
    setup_email
    subject "[#{shooter.name}] Shooter Notification"
    recipients shooter.user.email
    sent_on Time.now
    body :shooter => shooter
  end

  def setup_email
    from "Shooter <noreply@shooterapi.com>"
  end
  

end
