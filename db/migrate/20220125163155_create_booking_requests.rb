class CreateBookingRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :date
      t.boolean :is_confirmed

      t.timestamps
    end
  end
end
