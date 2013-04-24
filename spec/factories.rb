FactoryGirl.define do 

  factory :user do
    email "lunarcertificateauthority@gmail.com"
    password "foobarfoo"
  end

  factory :kitchen do
    name "Test Kitchen"
    auth_code "test_authcode"
  end

end