class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :seat, optional: true

  validates_uniqueness_of :seat_id, if: :seat_id
  validate :date_range

  enum role: [:staff, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def seat_period
    if seat_from_date.present? && seat_end_date.present?
      "#{seat_from_date.strftime('%d-%m-%y')} to #{seat_end_date.strftime('%d-%m-%y')}"
    end
  end

  def self.send_seats_status

  end

  def set_default_role
    self.role ||= :staff
  end

  def date_range
    return unless self.seat_end_date
    return unless self.seat_from_date
    self.errors.add(:date_range, "end date should be greater than start date" ) unless self.seat_end_date >= self.seat_from_date
  end
end
