5.times do |each|
  Contact.create(
    name: "contact_#{each}",
    email: "contact_#{each}@email.com",
    phone: "1800 123 1234",
    address: "123 st. Here, State 12342",
    company: "contact_#{each} company",
    birtday: DateTime.strptime("1/29/1980", "%m/%d/%Y" ) )
end