require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "abc@gmail.com", birth: "1993-09-03", password: "123456", name: "abc", gender: "Male", phone: 9876543456)
  end

  test "valid" do 
    assert @user.valid?
  end

  test "email should be present" do 
    @user.email = ""
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "name cannot be nil" do 
    @user.name = nil
    assert_not @user.valid?
  end

  test "gender cannot nil" do 
    @user.gender = nil
    assert_not @user.valid?
  end

  test "birth date cannot nil" do 
    @user.birth = nil
    assert_not @user.valid?
  end

  test "phone number cannot nil" do 
    @user.phone = nil
    assert_not @user.valid?
  end

  test "name cannot exceed limit" do 
    @user.name = "a" * 30
    assert_not @user.valid?
  end
end