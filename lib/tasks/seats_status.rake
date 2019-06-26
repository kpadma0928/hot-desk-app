namespace :users do

  namespace :seats_assigned do
    desc "Seats assigned status"
    task :deliver => :environment do |t, args|
      User.all.each do |user|
      	UserMailer.send_seats_status(user).devliver
      end
    end
  end
end  