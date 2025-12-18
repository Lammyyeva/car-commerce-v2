import gql from 'graphql-tag';

export const phoneAuthSchema = gql`
  extend type Mutation {
    """
    Register a new customer account using phone number
    """
    registerWithPhone(input: RegisterWithPhoneInput!): RegisterWithPhoneResult!

    """
    Verify customer account using phone number and verification token
    """
    verifyPhoneNumber(input: VerifyPhoneInput!): VerifyPhoneResult!

  }

  input RegisterWithPhoneInput {
    phoneNumber: String!
    password: String
  }

  input VerifyPhoneInput {
    phoneNumber: String!
    verificationToken: String!
    password: String
  }


  type RegisterWithPhoneResult {
    success: Boolean!
    verificationToken: String
    message: String
  }

  type VerifyPhoneResult {
    success: Boolean!
    message: String
  }
`