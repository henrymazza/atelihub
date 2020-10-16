class AddReadmeToRepositories < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :readme, :jsonb
    add_column :repositories, :contents, :jsonb
  end
end
