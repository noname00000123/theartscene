australia = Spree::Country.find_by!(name: 'Australia')
nsw       = Spree::State.find_by!(name: 'New South Wales')

# Billing address
Spree::Address.create!(
  :firstname  => 'Daniel',
  :lastname   => 'Small',
  :address1   => '914 Victoria Road',
  :address2   => nil,
  :city       => 'West Ryde',
  :state      => nsw,
  :zipcode    => 2114,
  :country    => australia,
  :phone      => '61 402 000 000')

#Shipping address
Spree::Address.create!(
  :firstname  => 'Associate',
  :lastname   => Faker::Name.last_name,
  :address1   => Faker::Address.street_address,
  :address2   => Faker::Address.secondary_address,
  :city       => Faker::Address.city,
  :state      => nsw,
  :zipcode    => 2114,
  :country    => australia,
  :phone      => Faker::PhoneNumber.phone_number)
