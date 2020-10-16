class AddOwnerToRepository < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :owner, :jsonb
  end
end
