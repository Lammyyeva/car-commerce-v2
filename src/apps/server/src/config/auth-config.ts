import { CustomFields, LanguageCode } from "@vendure/core";

export const customFields: CustomFields = {
    // Customer: [
    //     {
    //         name: 'isPhoneOnlyAccount',
    //         type: 'boolean',
    //         public: true,
    //         nullable: true,
    //         defaultValue: false,
    //         label: [{ languageCode: LanguageCode.en, value: 'Phone-Only Account'}],
    //     },
    //     {
    //         name: 'preferredAccount',
    //         type: 'string',
    //         nullable: true,
    //         public: true,
    //         defaultValue: 'email',
    //         options: [
    //             {value: 'sms'},
    //             {value: 'email'},
    //             {value: 'both'},
    //         ],
    //         label: [{ languageCode: LanguageCode.en, value: 'preferred account'}]
    //     }
    // ],
    User: [
        {
            name: 'phoneNumber',
            type: 'string',
            nullable: true,
        }
    ]
}