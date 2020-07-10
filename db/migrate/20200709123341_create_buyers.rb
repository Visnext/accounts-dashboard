class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
    	t.string "name"
	    t.string "email"
	    t.string "country"
	    t.string "phone"
	    t.timestamps
    end
  end
end
