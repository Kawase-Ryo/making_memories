class Photo < ApplicationRecord

    belongs_to :post
    validates :image, presence: true
    # presence: trueは値が空ではないということ確かめるバリデーション

    mount_uploader :image, ImageUploader
    # PhotoモデルのimageカラムとImageUploaderと紐付け
    
end
