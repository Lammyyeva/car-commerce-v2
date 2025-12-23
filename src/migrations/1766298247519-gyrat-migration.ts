import {MigrationInterface, QueryRunner} from "typeorm";

export class GyratMigration1766298247519 implements MigrationInterface {

   public async up(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "user" ADD "customFieldsPhonenumber" character varying(255)`, undefined);
        await queryRunner.query(`ALTER TABLE "user" ADD CONSTRAINT "UQ_3f31e1d198a699ee8fc59185345" UNIQUE ("customFieldsPhonenumber")`, undefined);
   }

   public async down(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.query(`ALTER TABLE "user" DROP CONSTRAINT "UQ_3f31e1d198a699ee8fc59185345"`, undefined);
        await queryRunner.query(`ALTER TABLE "user" DROP COLUMN "customFieldsPhonenumber"`, undefined);
   }

}
