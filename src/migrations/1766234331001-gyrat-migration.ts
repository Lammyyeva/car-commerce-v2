import {MigrationInterface, QueryRunner} from "typeorm";

export class GyratMigration1766234331001 implements MigrationInterface {

   public async up(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "user" DROP COLUMN "customFieldsPhonenumber"`, undefined);
        await queryRunner.query(`ALTER TABLE "customer" DROP COLUMN "customFieldsIsphoneonlyaccount"`, undefined);
        await queryRunner.query(`ALTER TABLE "customer" DROP COLUMN "customFieldsPreferredaccount"`, undefined);
   }

   public async down(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "customer" ADD "customFieldsPreferredaccount" character varying(255) DEFAULT 'email'`, undefined);
        await queryRunner.query(`ALTER TABLE "customer" ADD "customFieldsIsphoneonlyaccount" boolean DEFAULT false`, undefined);
        await queryRunner.query(`ALTER TABLE "user" ADD "customFieldsPhonenumber" character varying(255)`, undefined);
   }

}
