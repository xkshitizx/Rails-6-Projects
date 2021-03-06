class Profile < ApplicationRecord

	attr_accessor :remove_photo


	after_save :purge_photo, if: :remove_photo
	private def purge_photo
		photo.purge_later
	end


	has_one_attached :photo
end
