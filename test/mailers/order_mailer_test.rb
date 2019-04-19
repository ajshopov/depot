require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Store Order Confirmation", mail.subject
    assert_equal ["alex@example.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 2.0/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Store Order Has Shipped", mail.subject
    assert_equal ["alex@example.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td[^>]*>1 <\/td>\s*<td>Programming Ruby 2.0 <\/td>/, mail.body.encoded
  end

end