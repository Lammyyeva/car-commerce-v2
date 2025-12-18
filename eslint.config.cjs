// eslint.config.js (ESM + flat config)
const tsParser = require('@typescript-eslint/parser');
const tsPlugin = require('@typescript-eslint/eslint-plugin');

module.exports = [
    // Ignore files
    {
        ignores: ['**/*.d.ts', 'node_modules/**', 'dist/**'],
    },

    // TypeScript rules
    {
        files: ['**/*.ts', '**/*.tsx'],
        languageOptions: {
            parser: tsParser,
            parserOptions: {
                project: './tsconfig.json',
                sourceType: 'module',
            },
        },
        plugins: {
            '@typescript-eslint': tsPlugin

        },
        rules: {
            '@typescript-eslint/interface-name-prefix': 'off',
            '@typescript-eslint/explicit-function-return-type': 'off',
            '@typescript-eslint/explicit-module-boundary-types': 'off',
            '@typescript-eslint/no-explicit-any': 'off',
            '@typescript-eslint/no-unused-vars': 'warn',
            '@typescript-eslint/ban-ts-comment': 'off',
            '@typescript-eslint/no-var-requires': 'off',
            '@typescript-eslint/no-restricted-imports': 'warn',
            'prefer-const': ['error', { destructuring: 'all' }],
            'no-restricted-imports': 'warn',
            'max-len': [
                'error',
                {
                    code: 260,
                    tabWidth: 2,
                    ignoreComments: true,
                    ignoreUrls: true,
                    ignoreRegExpLiterals: true,
                },
            ],

        },
    },

    // JavaScript rules
    {
        files: ['**/*.js', '**/*.jsx'],
        languageOptions: {
            parserOptions: {
                sourceType: 'module',
            },
        },
        rules: {
            'no-console': 'warn',
            'semi': ['error', 'always'],
        },
    },
];
