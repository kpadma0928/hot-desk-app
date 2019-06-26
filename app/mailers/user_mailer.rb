class UserMailer < ActionMailer::Base
	  default from: "kpadma0928@gmail.com"
 
	def send_seats_status(user)
		@user = user
		@seats_assigned_users = User.where("seat_id is not null")
		@seats_not_assigned_users = User.where("seat_id is null")
		@available_seats = Seat.where("id not in (?)", @seats_assigned_users.map(&:seat_id))
		mail(to: @user.email, subject: 'Sample Email')


	end
end
