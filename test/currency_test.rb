require "minitest/autorun"
require "currency"

class CurrencyTest < MiniTest::Unit::TestCase
  def test_create_new_instance_with_new
    amount = 15
    currency_code = "EUR"
    money = Currency.new(amount, currency_code)
    refute_nil money
  end
  def test_every_currency_object_has_amt_and_code
    amount = 10
    currency = "RMB"
    money = Currency.new(10, "RMB")
    assert_equal money.amount, 10
    assert_equal money.currency_code, "RMB"
  end

  def test_addr_accessor_writer
    amount = 10
    currency = "RMB"
    money = Currency.new(10, "RMB")
    assert_equal money.amount, 10
    assert_equal money.currency_code, "RMB"

    money.amount=(40)
    assert_equal money.amount, 40
    money.currency_code=("USD")
    assert_equal money.currency_code, "USD"
  end

  def test_amt_and_currency_are_the_same_for_2_instances_equals_true
    money = Currency.new(10,"RMB")
    money2 = Currency.new(10,"RMB")
    money.amount = 10
    money.currency_code = "RMB"
    money2.amount = 10
    money2.currency_code = "RMB"
    assert_equal money, money2
  end

  def test_currency_adds_when_same_code
    money = Currency.new(15,"RMB")
    money2 = Currency.new(10,"RMB")
    money.amount = 15
    money.currency_code = "RMB"
    money2.amount = 10
    money2.currency_code = "RMB"
    # assert_equal (money + money2), (25,"RMB") syntax error
    # #in `require': /Users/Conley/currency/test/currency_test.rb:49: syntax error, unexpected ',', expecting ')' (SyntaxError)
    # assert_equal (money + money2), (25,"RMB")
    #                                    ^


  def test_currency_subtracts_when_same_code
    money = Currency.new(15,"RMB")
    money2 = Currency.new(10,"RMB")
    money.amount = 15
    money.currency_code = "RMB"
    money2.amount = 10
    money2.currency_code = "RMB"
    assert_equal money - money2, Currency.new(5,"RMB")
  end

  def if_currency_code_different_raises_error
    money == Currency.new(15,"RMB")
    money2 == Currency.new(10,"USD")
    if money.currency_code != money2.currency_code
      assert_raises DifferentCurrencyCodeError
    end
  end

  def test_currency_can_be_multipled_yields_float
    money = Currency.new(15,"RMB")
    money.amount = 15
    money.currency_code = "RMB"
    multiplier = 2
    assert_equal money*2, Currency.new(30,"RMB")
  end

end
end
