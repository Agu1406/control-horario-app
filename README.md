# Control Horario App

Aplicación de control de horarios desarrollada con NestJS (backend) y tecnologías modernas.

## Configuración Inicial del Backend

### 1. Instalación del CLI de NestJS

Para trabajar con NestJS en nuestro proyecto debemos instalar el framework, sus dependencias,
módulos, tecnologías, etc, para ellos, desde el directorio raíz debemos ejecutar el siguiente
comando:

```bash
npm install -g @nestjs/cli
```

### 2. Creación del Proyecto Backend

Con el entorno listo para trabajar con NestJS lo siguiente es crear el directorio "backend"
con NestJS, para ellos ejecutamos el siguiente comando:

```bash
nest new backend
```

Se nos va a preguntar el nombre del gestor de paquetes, en mi caso elegí "npm" y el nombre
ya fue dado en el comando ("backend").

### 3. Configuración de Fastify

Nos debemos desplazar al directorio del backend e instala la plataforma Fastify para
utilizarla en lugar Express que es quien viene por defecto, una vez en el directorio
de "backend" ejecutamos el siguiente comando:

```bash
npm install @nestjs/platform-fastify
```

### 4. Configuración del Main.ts

Ahora que ya hemos instalado NestJS y lo hemos preparado para utilizat Fastify debemos de
modificar el archivo `backend/src/main.ts` para usar Fastify en lugar de Express agregando
al archivo la sigueinte importación:

```Typescript
import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';
```

Si todo ha ido bien podemos probar a ejecutar el proyecto en modo desarrollador (developer)
con el comando:

```bash
npm run start:dev
```

Esto debería permitirnos abrir por defecto un http://localhost:3000 y visualizar un "hello world".

### 5. Creación del recurso "USUARIO" 

## Estándar de Commits

Este proyecto sigue el estándar de commits convencionales para mantener un historial de cambios claro y estructurado.

### Formato del Commit

```
tipo(alcance): mensaje/descripción
```

### Tipos de Commit

- **feat**: Nueva funcionalidad
- **fix**: Corrección de errores
- **docs**: Cambios en documentación
- **style**: Cambios que no afectan el código (espacios, formato, etc.)
- **refactor**: Refactorización del código sin cambiar funcionalidad
- **perf**: Mejoras de rendimiento
- **test**: Agregar o modificar tests
- **chore**: Cambios en herramientas, configuraciones, etc.

### Alcance (Opcional)

El alcance indica qué parte del proyecto se ve afectada:
- **api**: Cambios en la API del backend
- **frontend**: Cambios en el frontend
- **database**: Cambios en la base de datos
- **auth**: Cambios en autenticación
- **ui**: Cambios en la interfaz de usuario
- **config**: Cambios en configuración

### Ejemplos de Commits

```
feat(auth): agregar autenticación con JWT
fix(api): corregir error en endpoint de usuarios
docs(readme): actualizar instrucciones de instalación
style(frontend): formatear código según estándares
refactor(api): reorganizar estructura de controladores
perf(database): optimizar consultas de usuarios
test(api): agregar tests para endpoints de autenticación
chore(deps): actualizar dependencias del proyecto
```

### Reglas Importantes

1. **Usar imperativo**: "agregar" en lugar de "agregado" o "agrega"
2. **No capitalizar la primera letra**: comenzar con minúscula
3. **No terminar con punto**: el mensaje no debe terminar con punto
4. **Ser específico**: describir claramente qué cambia
5. **Mantener consistencia**: usar los mismos términos en commits similares

### Commit sin Alcance

Si el cambio afecta a todo el proyecto o no es específico de una área:

```
feat: agregar sistema de logging global
fix: corregir errores de compilación
docs: actualizar README principal
```


