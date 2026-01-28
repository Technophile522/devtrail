<div align="center">

<img src="../../assets/logo-monimen.svg" alt="Monimen Logo" width="160" height="160">

# Enigmora Monimen Framework

**Gobernanza de Documentación para Desarrollo de Software Asistido por IA**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../../LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Documentation](https://img.shields.io/badge/docs-ADOPTION--GUIDE-orange.svg)](ADOPTION-GUIDE.md)
[![Enigmora](https://img.shields.io/badge/by-Enigmora-purple.svg)](https://enigmora.com)

[Inicio Rápido](#inicio-rápido) •
[Características](#características) •
[Documentación](#documentación) •
[Contribuir](#contribuir)

**Idiomas**: [English](../../README.md) | Español

</div>

---

## El Problema

A medida que los asistentes de codificación con IA se vuelven parte integral del desarrollo de software, surge una brecha crítica:

- **¿Quién hizo este cambio?** ¿Fue un desarrollador o un asistente de IA?
- **¿Por qué se tomó esta decisión?** ¿Qué alternativas se consideraron?
- **¿Debería haberse revisado esto?** ¿Fue apropiada la supervisión humana?
- **¿Cuál es el impacto?** ¿Qué tan riesgoso es este cambio?

Sin documentación estructurada, el desarrollo asistido por IA se convierte en una caja negra.

## La Solución

Enigmora Monimen Framework proporciona un **sistema de gobernanza de documentación** que asegura:

> **"Ningún cambio significativo sin un rastro documentado."**

Cada cambio significativo—ya sea hecho por un humano o una IA—está documentado, atribuido y puede ser revisado.

---

## Características

### Documentación Estructurada

Ocho tipos de documentos que cubren todo el ciclo de vida del desarrollo:

| Tipo | Propósito | Ejemplo |
|------|-----------|---------|
| **REQ** | Requisitos | Requisitos del sistema, historias de usuario |
| **ADR** | Decisiones de Arquitectura | Elecciones tecnológicas, patrones de diseño |
| **TES** | Planes de Prueba | Estrategias de prueba, objetivos de cobertura |
| **INC** | Post-mortems de Incidentes | Análisis de causa raíz, lecciones aprendidas |
| **TDE** | Deuda Técnica | Deuda identificada, planes de remediación |
| **AILOG** | Logs de Acciones de IA | Qué hicieron los asistentes de IA y por qué |
| **AIDEC** | Decisiones de IA | Elecciones hechas por IA con alternativas |
| **ETH** | Revisiones Éticas | Privacidad, sesgo, IA responsable |

### Soporte para Agentes IA

Pre-configurado para asistentes de codificación con IA populares:

- **Claude Code** (Anthropic) → `CLAUDE.md`
- **Cursor** → `.cursorrules`
- **GitHub Copilot CLI** → `.github/copilot-instructions.md`
- **Gemini CLI** (Google) → `GEMINI.md`

Cada configuración instruye a la IA a:
- Identificarse en cada documento
- Declarar niveles de confianza
- Solicitar revisión humana cuando sea apropiado
- Seguir convenciones de nomenclatura

### Supervisión Humana

Salvaguardas incorporadas que aseguran que los humanos mantengan el control:

- **Niveles de autonomía**: Algunos tipos de documentos requieren aprobación humana
- **Disparadores de revisión**: Baja confianza o alto riesgo → revisión obligatoria
- **Revisiones éticas**: Preocupaciones de privacidad y sesgo marcadas para decisión humana

### Validación y CI/CD

Herramientas de validación automatizadas:

- **Hooks pre-commit** (Bash) - Validar antes de commit
- **Script PowerShell** - Validación compatible con Windows
- **GitHub Actions** - Flujo de trabajo de validación de PR

---

## Inicio Rápido

### Inicio Rápido (Proyecto Nuevo)

**Opción 1: Usar como Plantilla** (Recomendado)

Haz clic en el botón **"Use this template"** arriba para crear un nuevo repositorio con Enigmora Monimen Framework pre-configurado.

**Opción 2: Clonar y Copiar**

```bash
# Clonar Enigmora Monimen Framework
git clone https://github.com/enigmora/monimen-framework.git

# Copiar a tu proyecto
cp -r monimen-framework/.monimen tu-proyecto/
cp monimen-framework/CLAUDE.md tu-proyecto/
cp monimen-framework/GEMINI.md tu-proyecto/
cp monimen-framework/.cursorrules tu-proyecto/
cp -r monimen-framework/.github tu-proyecto/
cp -r monimen-framework/scripts tu-proyecto/
```

### Inicio Rápido (Proyecto Existente)

```bash
# Descargar Enigmora Monimen Framework
git clone https://github.com/enigmora/monimen-framework.git monimen-temp

# Copiar sin sobrescribir (Linux/Mac)
cp -rn monimen-temp/.monimen ./
cp -n monimen-temp/CLAUDE.md ./
cp -n monimen-temp/GEMINI.md ./
cp -n monimen-temp/.cursorrules ./
cp -rn monimen-temp/.github ./
cp -rn monimen-temp/scripts ./

# Limpiar
rm -rf monimen-temp

# Commit
git add .monimen/ CLAUDE.md GEMINI.md .cursorrules .github/ scripts/
git commit -m "chore: adoptar Enigmora Monimen Framework"
```

**Ver [ADOPTION-GUIDE.md](ADOPTION-GUIDE.md) para instrucciones detalladas, estrategias de migración y planes de implementación en equipos.**

---

## Documentación

### Referencia Rápida

```
.monimen/
├── 00-governance/           # Políticas y reglas
├── 01-requirements/         # Documentos REQ
├── 02-design/decisions/     # Documentos ADR
├── 03-implementation/       # Guías de implementación
├── 04-testing/              # Documentos TES
├── 05-operations/incidents/ # Documentos INC
├── 06-evolution/technical-debt/ # Documentos TDE
├── 07-ai-audit/
│   ├── agent-logs/          # Documentos AILOG
│   ├── decisions/           # Documentos AIDEC
│   └── ethical-reviews/     # Documentos ETH
└── templates/               # Plantillas de documentos
```

### Convención de Nomenclatura

```
[TIPO]-[YYYY-MM-DD]-[NNN]-[descripcion].md
```

Ejemplo: `ADR-2025-01-27-001-usar-postgresql-para-persistencia.md`

### Documentos Clave

| Documento | Descripción |
|-----------|-------------|
| [ADOPTION-GUIDE.md](ADOPTION-GUIDE.md) | Guía completa de adopción |
| [.monimen/QUICK-REFERENCE.md](../../.monimen/QUICK-REFERENCE.md) | Tarjeta de referencia de una página |
| [.monimen/00-governance/PRINCIPLES.md](../../.monimen/00-governance/i18n/es/PRINCIPLES.md) | Principios guía |
| [.monimen/00-governance/AGENT-RULES.md](../../.monimen/00-governance/i18n/es/AGENT-RULES.md) | Reglas para agentes IA |

---

## Cómo Funciona

### 1. La IA Hace un Cambio

Un asistente de IA trabajando en tu código automáticamente:

```yaml
# Crea: .monimen/07-ai-audit/agent-logs/AILOG-2025-01-27-001-implementar-auth.md
---
id: AILOG-2025-01-27-001
title: Implementar autenticación JWT
agent: claude-code-v1.0
confidence: high
risk_level: high
review_required: true
---
```

### 2. Humano Revisa (Cuando es Necesario)

Cambios de alto riesgo o baja confianza son marcados:

```
AILOG-2025-01-27-001-implementar-auth.md
   Agent: claude-code-v1.0
   Confidence: high
   Risk Level: high
   Review Required: YES
```

### 3. Las Decisiones se Preservan

Al elegir entre alternativas, las decisiones se documentan:

```yaml
# Crea: .monimen/07-ai-audit/decisions/AIDEC-2025-01-27-001-estrategia-auth.md
---
id: AIDEC-2025-01-27-001
title: Elegir JWT sobre autenticación basada en sesiones
alternatives_considered:
  - JWT tokens (elegido)
  - Session cookies
  - Solo OAuth
justification: "Requisito de arquitectura sin estado..."
---
```

### 4. Preocupaciones Éticas son Marcadas

Cuando la IA encuentra consideraciones éticas:

```yaml
# Crea: .monimen/07-ai-audit/ethical-reviews/ETH-2025-01-27-001-datos-usuario.md
---
id: ETH-2025-01-27-001
title: Alcance de recolección de datos de usuario
status: draft  # Requiere aprobación humana
review_required: true
concerns:
  - Cumplimiento GDPR
  - Minimización de datos
---
```

---

## Validación

### Hook Pre-commit

```bash
# Instalar el hook pre-commit
cp scripts/pre-commit-docs.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### Validación Manual

```bash
# Linux/Mac
bash scripts/pre-commit-docs.sh

# Windows PowerShell
.\scripts\validate-docs.ps1
```

### GitHub Actions

El flujo de trabajo incluido (`.github/workflows/docs-validation.yml`) valida automáticamente:
- Convenciones de nomenclatura de archivos
- Campos de metadatos requeridos
- Detección de información sensible
- Formato Markdown
- Integridad de enlaces internos

---

## Skills

Monimen Framework incluye skills para agentes IA que habilitan la **creación activa de documentación**.

> **Sistema Binario**: Monimen usa un sistema pasivo (agentes auto-documentan via instrucciones de contexto) y un sistema activo (usuarios invocan skills para crear documentación manualmente o cuando el agente omitió algo).

### Skills Disponibles

| Skill | Propósito | Claude | Gemini |
|-------|-----------|--------|--------|
| `/monimen-status` | Verificar cumplimiento de documentación | ✅ | ✅ |
| `/monimen-new` | Crear cualquier tipo de documento (unificado) | ✅ | ✅ |
| `/monimen-ailog` | Creación rápida de AILOG | ✅ | ✅ |
| `/monimen-aidec` | Creación rápida de AIDEC | ✅ | ✅ |
| `/monimen-adr` | Creación rápida de ADR | ✅ | ✅ |

### Ejemplos de Uso

```bash
# Verificar estado de documentación
/monimen-status

# Crear documentación (agente sugiere tipo)
/monimen-new

# Forzar tipo específico
/monimen-new ailog

# Accesos directos
/monimen-ailog
/monimen-aidec
/monimen-adr
```

### Scripts Shell (Uso Manual)

Para usuarios que prefieren línea de comandos o usan agentes sin soporte de skills:

```bash
# Creación interactiva de documentos
./scripts/monimen-new.sh

# Crear tipo específico directamente
./scripts/monimen-new.sh ailog

# Verificar estado de documentación
./scripts/monimen-status.sh
```

### Reporte de Agentes

Los agentes IA reportan su estado de documentación al final de cada tarea:

| Estado | Significado |
|--------|-------------|
| `Monimen: Created AILOG-...` | Documentación fue creada |
| `Monimen: No documentation required` | Cambio menor (<10 líneas) |
| `Monimen: Documentation pending` | Puede necesitar revisión manual |

---

## Plataformas Soportadas

### Asistentes de Codificación IA

| Plataforma | Archivo de Config | Estado |
|------------|-------------------|--------|
| Claude Code | `CLAUDE.md` | Soporte completo |
| Cursor | `.cursorrules` | Soporte completo |
| GitHub Copilot CLI | `.github/copilot-instructions.md` | Soporte completo |
| Gemini CLI | `GEMINI.md` | Soporte completo |

### Sistemas Operativos

| SO | Script de Validación |
|----|---------------------|
| Linux | `scripts/pre-commit-docs.sh` |
| macOS | `scripts/pre-commit-docs.sh` |
| Windows | `scripts/validate-docs.ps1` |

### Plataformas CI/CD

| Plataforma | Soporte |
|------------|---------|
| GitHub Actions | Flujo de trabajo incluido |
| GitLab CI | Adaptable desde GitHub Actions |
| Azure DevOps | Adaptable desde GitHub Actions |

---

## Alineación con Estándares

Enigmora Monimen Framework se alinea con:

- **ADR** (Architecture Decision Records) - Soporte nativo
- **IEEE 830** - Estructura de documentación de requisitos
- **ISO/IEC 25010** - Atributos de calidad en ADRs
- **GDPR** - Documentación de impacto de privacidad (ETH)
- **EU AI Act** - Transparencia de IA y supervisión humana
- **NIST AI RMF** - Documentación de riesgos

---

## Contribuir

¡Damos la bienvenida a contribuciones! Ver [CONTRIBUTING.md](CONTRIBUTING.md) para guías.

### Formas de Contribuir

- Reportar bugs
- Sugerir características
- Mejorar documentación
- Enviar pull requests
- Agregar traducciones

---

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](../../LICENSE) para detalles.

---

## Acerca de Enigmora

<div align="center">

<img src="../../assets/logo-enigmora.svg" alt="Enigmora Logo" width="60">

**[Enigmora](https://enigmora.com)** construye herramientas para desarrollo de software responsable asistido por IA.

[Sitio Web](https://enigmora.com) • [GitHub](https://github.com/enigmora)

</div>

---

<div align="center">

**Enigmora Monimen Framework** — Porque cada cambio cuenta una historia.

[Volver arriba](#enigmora-monimen-framework)

</div>
