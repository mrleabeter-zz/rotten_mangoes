class Movie < ActiveRecord::Base

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

# # How can I review a movie that releases in the future?  If I have a time machine, I'm definitely going to use it for better things than reviewing movies.
#   validate :release_date_is_in_the_future

  protected

# # See above
  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end


end
