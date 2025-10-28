import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { VersioningType } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);  

  const config = new DocumentBuilder()
    .setTitle('E-commerce API')
    .setDescription('API documentation for e-commerce application')
    .setVersion('1')
    .build();

  const document = SwaggerModule.createDocument(app, config);

  SwaggerModule.setup('api', app, document);


  // app.enableVersioning({
  //   type: VersioningType.URI,
  //   prefix: '1'
  // })  
  await app.listen(process.env.PORT ?? 3000);
  
}
bootstrap();
