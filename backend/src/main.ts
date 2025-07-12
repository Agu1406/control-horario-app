import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
// Importamos el módulo de Fastify para usarlo en lugar de Express
import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

async function bootstrap() {
  const app = await NestFactory.create<NestFastifyApplication>(AppModule, new FastifyAdapter());
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
