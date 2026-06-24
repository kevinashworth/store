# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/email_confirmation
  def email_confirmation
    UserMailer.with(user: sample_user).email_confirmation
  end

  private
    def sample_user
      User.take || User.new(
        email_address: "preview@example.com",
        unconfirmed_email: "preview@example.com",
        first_name: "Preview",
        last_name: "User",
        password: "password"
      )
    end
end
