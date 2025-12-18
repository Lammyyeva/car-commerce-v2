import {MigrationInterface, QueryRunner} from "typeorm";

export class GyratMigration1765975031031 implements MigrationInterface {

   public async up(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "user" ADD "customFieldsPhonenumber" character varying(255)`, undefined);
   }

   public async down(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "user" DROP COLUMN "customFieldsPhonenumber"`, undefined);
   }

}
