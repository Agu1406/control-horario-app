Primero hemos instalado el CLI de NestJS globalmente con el comando npm install -g @nestjs/cli en el
directorio raiz del proyecto, acto seguido, desde la misma terminal hemos creado el nuevo proyecto NestJS
llamado backend utilizando el comando "nest new backend".

Ahora, nos desplazamos al directorio del backend desde la terminal y ejecutamos el comando "npm install @nestjs/platform-fastify" que permitira instalar la versión de NestJS que usa Fastify en lugar de Express (por defecto).

Finalmente, vamos a buscar el "main.ts" del backend y modificarlo para que arranque con Fastify en
lugar de Express agregando a las importaciones la siguiente importación:

import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

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


