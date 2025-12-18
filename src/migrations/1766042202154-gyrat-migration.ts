import {MigrationInterface, QueryRunner} from "typeorm";

export class GyratMigration1766042202154 implements MigrationInterface {

   public async up(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "customer" ADD "customFieldsIsphoneonlyaccount" boolean DEFAULT false`, undefined);
        await queryRunner.query(`ALTER TABLE "customer" ADD "customFieldsPreferredaccount" character varying(255) DEFAULT 'email'`, undefined);
   }

   public async down(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "customer" DROP COLUMN "customFieldsPreferredaccount"`, undefined);
        await queryRunner.query(`ALTER TABLE "customer" DROP COLUMN "customFieldsIsphoneonlyaccount"`, undefined);
   }

}
