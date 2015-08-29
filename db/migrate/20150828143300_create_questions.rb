class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :body, null:false, limit: 256
  		t.references :survey
  		t.timestamps
  	end	
  end
end
