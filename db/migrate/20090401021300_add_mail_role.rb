class AddMailRole < ActiveRecord::Migration
  def self.up
    Role.create :name => "mail_list"
  end

  def self.down
    Role.find_by_name("mail_list").destroy
  end
end
