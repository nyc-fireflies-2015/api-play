class CreateTakenSurveys < ActiveRecord::Migration
  def change
  	create_table :taken_surveys do |t|
  		t.references :survey 
  		t.references :taker
  		t.timestamps
  	end 	
  end
end
