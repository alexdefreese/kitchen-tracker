FactoryGirl.define do 

  factory :user do
    email "lunarcertificateauthority@gmail.com"
    password "foobarfoo"
  end

  factory :kitchen do
    name "Test Kitchen"
    description "A kitchen to test"
    auth_code "testauthcode"
  end

end