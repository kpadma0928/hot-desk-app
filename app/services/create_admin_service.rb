class CreateAdminService
  def call
    user = User.find_or_create_by!(email: 'kpadma0928@gmail.com') do |user|
    	user.name = 'kpadma0928'
        user.password = 'test1234'
        user.password_confirmation = 'test1234'
        user.role = :admin
      end

      (1..10).to_a.each{|i| Seat.create(name: "A#{i}")}
      (1..10).to_a.each{|i| Seat.create(name: "B#{i}")}
      (1..10).to_a.each{|i| Seat.create(name: "C#{i}")}
      user
  end
end
