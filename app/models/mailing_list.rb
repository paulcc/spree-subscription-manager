class MailingList < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, :through => :subscriptions

  validates_presence_of :form_text, :name
end
