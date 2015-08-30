class CreateSelections < ActiveRecord::Migration
  def change
  	create_table :selections do |t|
  		t.references :choice, null: false
  		t.references :user, null: false
      t.references :taken_survey, null: false

  		t.timestamps null: false
  	end
  end
end
