class AddNameUniquenessIndex < ActiveRecord::Migration
  def change
    def self.up
      add_index :users, :name, :unique => true
    end

    def self.down
      remove_index :users, :name
    end
  end
end
