class User < ApplicationRecord
has_many :appts, dependent: :destroy
has_many :doctors, through: :appts

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
