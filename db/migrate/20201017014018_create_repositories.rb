class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
