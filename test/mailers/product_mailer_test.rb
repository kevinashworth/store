require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product = products(:one)
    subscriber = subscribers(:one)
    mail = ProductMailer.with(product:, subscriber:).in_stock

    assert_equal "In stock", mail.subject
    assert_equal [ subscriber.email ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match product.name, mail.body.encoded
  end
end
