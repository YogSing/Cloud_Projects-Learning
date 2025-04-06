resource "azuread_group" "devops" {
  display_name     = "DevOps Department"
  security_enabled = true
}

resource "azuread_group_member" "devops" {
  for_each         = { for user in azuread_user.users : user.mail_nickname => user if user.department == "DevOps" }
  group_object_id  = azuread_group.devops.id
  member_object_id = each.value.id
}

resource "azuread_group" "manager" {
  display_name     = "Manager Department"
  security_enabled = true
}

resource "azuread_group_member" "manager" {
  for_each         = { for user in azuread_user.users : user.mail_nickname => user if user.job_title == "Manager" }
  group_object_id  = azuread_group.manager.id
  member_object_id = each.value.id
}


resource "azuread_group" "project" {
  display_name     = "Project Managers"
  security_enabled = true
}

resource "azuread_group_member" "project" {
  for_each         = { for user in azuread_user.users : user.mail_nickname => user if user.department == "Project" }
  group_object_id  = azuread_group.project.id
  member_object_id = each.value.id
}


resource "azuread_group" "security" {
  display_name     = "Security Department"
  security_enabled = true
}

resource "azuread_group_member" "security" {
  for_each         = { for user in azuread_user.users : user.mail_nickname => user if user.department == "Security" }
  group_object_id  = azuread_group.security.id
  member_object_id = each.value.id
}