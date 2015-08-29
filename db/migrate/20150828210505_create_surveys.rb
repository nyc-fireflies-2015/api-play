class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null:false, limit: 50
      t.string :category, null:false, limit: 50
      t.references :creator
      t.timestamps
    end
  end
end
