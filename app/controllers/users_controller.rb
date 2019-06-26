class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def book_seat
    @user = current_user
    @seats = Seat.all
  end

  def assign_seat
    @seats = Seat.all
    @user = current_user
    respond_to do |format|
      if @user.update(seat_id: params[:seat_id], seat_from_date: params[:seat_from_date], seat_end_date: params[:seat_end_date] )
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :book_seat }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def user_params
      params.require(:user
        ).permit(:seat_id, :seat_from_date, :seat_end_date)
    end

end
