class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  
 private
 
  #アップロード画像のサイズ検証
 def picture_size
  if picture.size > 2.megabytes
   errors.add(:picture, "should be less than 2MB")
  end
 end
end
