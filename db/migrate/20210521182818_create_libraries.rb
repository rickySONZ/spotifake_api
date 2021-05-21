class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.user :belongs_to

      t.timestamps
    end
  end
end
