require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "email_confirmation" do
    user = users(:one)
    user.unconfirmed_email = "to@example.org"

    mail = UserMailer.with(user: user).email_confirmation
    assert_equal "Email confirmation", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Confirm your email", mail.body.encoded
  end
end
