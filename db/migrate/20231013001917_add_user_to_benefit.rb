class AddUserToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_reference :benefits, :user, null: false, foreign_key: true
  end
end
