class ProgramPicture < ApplicationRecord
  belongs_to :program, autosave: true, counter_cache: true
  mount_uploader :picture, ProgramPictureUploader
end
