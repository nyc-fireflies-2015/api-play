class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :body, null:false, limit: 256
  		t.references :survey, null: false

  		t.timestamps null: false
  	end
  end
end
