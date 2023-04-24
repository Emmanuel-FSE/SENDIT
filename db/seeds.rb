10.times do
    user = User.create(
      username: Faker::Internet.username,
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      password_digest: Faker::Internet.password,
      user_type: ['Admin', 'Customer'].sample
    )
    
    # Create a random number of parcels for the user (between 1 and 5)
    rand(1..5).times do
      parcel = Parcel.create(
        user_id: user.id,
        parcel_name: Faker::Commerce.product_name,
        pickup_location: Faker::Address.full_address,
        destination: Faker::Address.full_address,
        description: Faker::Lorem.paragraph,
        weight: rand(1..50),
        price: rand(10..100)
      )
      
      # Create a status for the parcel
      Status.create(
        parcel_id: parcel.id,
        location: Faker::Address.full_address,
        status: ['Delivered', 'In-transit', 'Cancelled', 'Pending'].sample
      )
    end
  end
