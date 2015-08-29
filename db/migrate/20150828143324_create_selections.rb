class CreateSelections < ActiveRecord::Migration
  def change
  	create_table :selections do |t|
  		t.references :choice
  		t.references :user
      t.references :taken_survey
  		t.timestamps
  	end
  end
end
