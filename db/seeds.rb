@user1 = User.create email: 'user1@email.com', 
  password: 'password', 
  password_confirmation: 'password'

@user2 = User.create email: 'user2@email.com',
  password: 'password',
  password_confirmation: 'password'

20.times do |each|
  Contact.create(
    name: 'contact_#{each}',
    email: 'contact_#{each}@email.com',
    phone: '1800 123 1234',
    address: '123 st. Here, State 12342',
    company: 'contact_#{each} company',
    birtday: DateTime.strptime('1/29/1980', '%m/%d/%Y' ),
    user_id: @user1.id)
end

20.times do |each|
  Contact.create(
    name: 'contact_#{each}',
    email: 'contact_#{each}@email.com',
    phone: '1800 123 1234',
    address: '123 st. Here, State 12342',
    company: 'contact_#{each} company',
    birtday: DateTime.strptime('1/29/1980', '%m/%d/%Y' ),
    user_id: @user2.id)
end