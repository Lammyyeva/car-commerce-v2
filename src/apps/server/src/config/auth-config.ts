import { CustomFields } from "@vendure/core";

export const customFields: CustomFields = {
    User: [
        {
            name: 'phoneNumber',
            type: 'string',
            nullable: true,
            unique: true, // Important for preventing duplicates
            //        validate: (value: string ) => {
            //     // Add phone number validation
            //       if (value && !/^\+?[1-9]\d{1,14}$/.test(value)) {
            //       return 'Invalid phone number format';
            //     }
            //   },
        }
    ]
}