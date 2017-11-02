class CreatePixels < ActiveRecord::Migration[5.0]
  def change
    create_table :pixels do |t|
      t.string :ip_address
      t.string :user_agent
      t.string :city
      t.string :state

      t.belongs_to :tracks, foreign_key: true

      t.timestamps
    end
  end
end
