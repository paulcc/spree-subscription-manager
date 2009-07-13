
role_name = "mail_list"
if Role.find_by_name(role_name).nil?
  Role.create :name => role_name
end

