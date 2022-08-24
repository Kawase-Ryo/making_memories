class AddUsernameToUser < ActiveRecord::Migration[6.0]
  #usernameカラムをstring型(文字列型)に指定(rails g migration AddUsernameToUser username:string)
  def change
    add_column :users, :username, :string, null: false, default: ""
    #カラムにNOT NULL制約（null: false）を追加します。NOT NULL制約とは、カラムに格納する値としてNULLを禁止
  end
end
