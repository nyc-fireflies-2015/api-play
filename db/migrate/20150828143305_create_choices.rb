class CreateChoices < ActiveRecord::Migration
  def change
  	create_table :choices do |t|
  		t.string :body, null:false, limit:256
  		t.references :question
  		t.timestamps
  	end	
  end
end
