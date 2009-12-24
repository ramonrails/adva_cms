class SiteAlias < ActiveRecord::Migration
  def self.up
    add_column :sites, :alias, :text
  end

  def self.down
    remove_column :sites, :alias
  end
end
