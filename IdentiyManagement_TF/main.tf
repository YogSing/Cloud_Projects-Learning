data "azuread_domains" "azure_ad" {
  only_initial = true
}

locals {
  domain_name = data.azuread_domains.azure_ad.domains.0.domain_name
  users       = csvdecode(file("users.csv"))
}

resource "azuread_user" "users" {
  for_each = { for user in local.users : user.first_name => user }
  user_principal_name = format(
    "%s%s@%s",
    lower(each.value.first_name),
    lower(each.value.last_name),
    local.domain_name
  )
  password = format(
    "%s%s%s!",
    lower(each.value.last_name),
    substr(lower(each.value.first_name), 0, 1),
    length(each.value.first_name)
  )
  force_password_change = true

  display_name = "${each.value.first_name} ${each.value.last_name}"

  department      = each.value.department
  job_title       = each.value.job_title
  company_name    = each.value.company_name
  office_location = each.value.office_location
}

output "domain" {
  value = data.azuread_domains.azure_ad.domains.*.domain_name
}

# 
#  output "user" {
#   value = [for user in azuread_user.users : "${user.display_name} ${user.user_principal_name} ${user.department} ${user.job_title} ${user.company_name} ${user.office_location}"]
# }

# output "groups" {
#   value = [for group in azuread_group.groups : "${group.display_name} ${group.object_id}"]
# }