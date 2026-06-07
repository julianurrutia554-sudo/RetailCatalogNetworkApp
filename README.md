Aplicación para iOS para explorar catálogos de productos minoristas. Desarrollada con **Arquitectura Limpia + MVVM-C** en Swift, utilizando concurrencia async/await.


## Tech Stack

| Capa | Tecnología |
|---|---|
| Lenguaje | Swift 5.x (async/await) |
| UI | UIKit |
| DI | [Factory](https://github.com/hmlongco/Factory) 3.0.5 |
| Imágenes | [Kingfisher](https://github.com/onevcat/Kingfisher) 8.9.0 |
| Persistencia | CoreData + Keychain |
| Networking | Submodule propio ([NetworkCore](https://github.com/julianurrutia554-sudo/NetworkCore)) |

## Arquitectura

```
SceneDelegate
  └─ ProductsCoordinator
       ├─ ProductListViewController ←→ ProductListViewModel
       │                              └─ FetchProductsUseCase
       │                                   └─ DefaultProductsRepository
       │                                        ├─ HTTPClient → URLSessionNetworkClient → dummyjson.com
       │                                        └─ ProductMapper (DTO → Domain)
       └─ ProductDetailViewController ←→ ProductDetailViewModel
```

El proyecto sigue Clean Architecture con 3 capas principales:

- **Domain** — Entidades, protocolos de repositorio, casos de uso
- **Data** — Implementación de repositorios, DTOs, mappers, definición de API
- **Presentation** — Vistas (UIKit), ViewModels, Coordinator (MVVM-C)

## Requisitos

- Xcode 15+
- iOS 16+ (por async/await generalizado)
- Cuenta de desarrollador (solo para correr en dispositivo)

## Setup

```bash
# Clonar con submódulos
git clone https://github.com/tu-usuario/RetailCatalogNetworkApp.git
cd RetailCatalogNetworkApp
git submodule update --init --recursive

# Abrir el proyecto
open RetailCatalogNetworkApp.xcodeproj
```

Seleccionar esquema **RetailCatalogNetworkApp** y correr en simulator.

## Configuración por entorno

El proyecto incluye configuraciones separadas vía `.xcconfig`:

| Config | Archivo | API Base URL |
|---|---|---|
| Development | `Configuration/Development.xcconfig` | `https://dummyjson.com` |
| Production | `Configuration/Production.xcconfig` | configurable |

La variable `API_BASE_URL` se lee desde `Info.plist` en tiempo de ejecución.

## API

Usa [dummyjson.com](https://dummyjson.com) como backend de prueba:

| Endpoint | Descripción |
|---|---|
| `GET /products` | Listado de productos |
| `GET /products/{id}` | Detalle de producto |

## Diagramas

Los diagramas de secuencia y componentes están en [`diagrams/`](diagrams/):

- [`secuencia_productos.md`](diagrams/secuencia_productos.md) — Flujo de carga de productos
- [`componentes_arquitectura.md`](diagrams/componentes_arquitectura.md) — Estructura de componentes

Los archivos `.md` contienen bloques ` ```plantuml ` renderizables en GitHub. Los `.png` adjuntos sirven como vista previa rápida.

## Estructura del proyecto

```
RetailCatalogNetworkApp/
├── Configuration/              # Build configs (Development, Production)
├── Network/                    # Submodule: capa de red reusable
├── RetailCatalogNetworkApp/
│   ├── Application/
│   │   ├── AppDelegate.swift
│   │   ├── SceneDelegate.swift
│   │   └── DI/                 # Contenedores Factory (global y de feature)
│   ├── Features/
│   │   └── ProductCatalogFeature/
│   │       ├── Domain/         # Entidades, repos protocol, use cases
│   │       ├── Data/           # DTOs, mappers, repos implementación, API
│   │       ├── Infrastructure/ # CoreData, Keychain
│   │       └── Presentation/   # Coordinator, ViewModels, Views, UI models
├── RetailCatalogNetworkAppTests/
└── RetailCatalogNetworkAppUITests/
```

## Licencia

Propietario Julian David Urrutia
