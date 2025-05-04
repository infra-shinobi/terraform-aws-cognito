name                              = "test-cognito"
user_pool_name                    = "test-cognito"
enable_username_case_sensitivity  = "true"
enable_token_revocation = true
deletion_protection = "ACTIVE"
alias_attributes = [
  "email",
  "preferred_username",
]

recovery_mechanisms = [
  {
    name     = "verified_email"
    priority = 1
  }
]

schemas = [
  {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "createdBy"
    required                 = false

    string_attribute_constraints = {
      min_length = 3
      max_length = 100
    }
  }
]

string_schemas = [
  {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = false
    name                     = "email"
    required                 = true
  }
]

admin_create_user_config_allow_admin_create_user_only = false

clients = [
  {
    name = "iam-client"
    allowed_oauth_flows_user_pool_client = false
    explicit_auth_flows           = [
      "ALLOW_ADMIN_USER_PASSWORD_AUTH",
      "ALLOW_REFRESH_TOKEN_AUTH",
      "ALLOW_USER_PASSWORD_AUTH"
    ]
    read_attributes               = [
      "address",
      "birthdate",
      "custom:createdBy",
      "email",
      "email_verified",
      "family_name",
      "gender",
      "given_name",
      "locale",
      "middle_name",
      "name",
      "nickname",
      "phone_number",
      "phone_number_verified",
      "picture",
      "preferred_username",
      "profile",
      "updated_at",
      "website",
      "zoneinfo"
    ]
  }
]