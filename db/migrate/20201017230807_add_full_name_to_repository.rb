class AddFullNameToRepository < ActiveRecord::Migration[6.0]
  def change
    add_column :repositories, :full_name, :string
  end
end
