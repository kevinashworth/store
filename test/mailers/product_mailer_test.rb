require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product = products(:tshirt)
    subscriber = subscribers(:david)
    mail = ProductMailer.with(product:, subscriber:).in_stock

    assert_equal "In stock", mail.subject
    assert_equal [ "david@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Good news!", mail.body.encoded
  end
end
