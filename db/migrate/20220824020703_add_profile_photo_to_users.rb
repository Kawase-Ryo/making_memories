class AddProfilePhotoToUsers < ActiveRecord::Migration[6.0]
  # rails g migration AddNameToUser name:string
  def change
    add_column :users, :profile_photo, :string
  end
end
