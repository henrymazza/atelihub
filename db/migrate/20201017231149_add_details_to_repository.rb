class AddDetailsToRepository < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :details, :jsonb
  end
end
