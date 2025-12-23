import { Role, User } from "@vendure/core";

export interface PhoneNumberInput{
    phoneNumber: string
}
export interface CustomFieldInput {
    customFields: PhoneNumberInput
}
export interface RegisterInput extends CustomFieldInput {
    password: string;
}

export interface VerifyPhoneInput extends CustomFieldInput {
    verificationCode: string;
}

export interface LoginInput extends CustomFieldInput {
    password: string;
}
export interface ResetPasswordInput extends CustomFieldInput {
    verificationCode: string;
    password: string;
}

// Return types for mutations
export interface BaseResponse {
    success: boolean;
    message: string;
}

export interface LoginResponse extends BaseResponse {
    user?: UserResponse
}

export interface UserResponse{
    identifier: string;
    verified: boolean;
    lastLogin: Date | null;
    customFields: ICustomFieldDetail;
    createdAt: Date;
    updatedAt: Date;
    deletedAt: Date | null;
    roles: Role[]
}

export interface ICustomFieldDetail{
    phoneNumber?: string;
}