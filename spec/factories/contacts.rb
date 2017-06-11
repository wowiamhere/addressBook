FactoryGirl.define do
  factory :contact do
    name "Test Name"
    email "testName@email.com"
    phone "123 123 1234"
    address "one dr. Apt #2, la, ca 90023"
    company "Test Company"
    birtday "2017-06-10"
  end

  factory :contact_1, class: Contact do 
    name "Test Name 2"
    email "testName2@email.com"
    phone "123 123 1234"
    address "one dr. Apt #2, la, ca 90023"
    company "Test Company"
    birtday "2017-06-10"
  end

end
