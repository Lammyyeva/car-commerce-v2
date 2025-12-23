import gql from 'graphql-tag';

export const phoneAuthSchema = gql`
  extend type Mutation {
    """
    Register a new customer account using phone number
    """
    registerWithPhone(input: RegisterWithPhoneInput!): BaseResult!
    """
    Verify customer account using phone number and verification token
    """
    verifyPhoneNumber(input: VerifyPhoneInput!): BaseResult!
    """
    Log in user using phone number and password
    """
    logIn(input: LogInInput!): LogInResult!
    """
    Forget password using phone number
    """
    forgetPassword(input: ForgetPasswordInput!): BaseResult!
    """
    Reset password using verification code, phone number and new password
    """
    resetPasswordWithPhone(input: ResetPasswordWithInput!): BaseResult!
  }

  extend type Query {
    """
    Gets new refresh token 
    """
    refreshToken: BaseResult!
    """
    Log out user 
    """
    logOut: BaseResult!
  }

  input CustomFieldsInput{
    phoneNumber: String!
  }
  type CustomFieldsType{
    phoneNumber: String!
  }

  input RegisterWithPhoneInput {
    customFields: CustomFieldsInput!
    password: String!
  }

  input VerifyPhoneInput {
    customFields: CustomFieldsInput!
    verificationCode: String!
  }

  input LogInInput {
    customFields: CustomFieldsInput!
    password: String!
  }

  type LogInResult {
    message: String!
    user: UserResponse!
  }

  type UserResponse {
    identifier: String!
    verified: Boolean!
    lastLogin: DateTime
    customFields: CustomFieldsType
    createdAt: DateTime!
    updatedAt: DateTime!
    deletedAt: DateTime
    roles: [Role!]!
  }

  type BaseResult {
    success: Boolean!
    message: String!
  }

  input ResetPasswordWithInput {
    verificationCode: String!
    customFields: CustomFieldsInput!
    password: String!
  }

  input ForgetPasswordInput {
    customFields: CustomFieldsInput!
  }
`