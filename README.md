
Modularización de Infraestructura de Red con Git Submodules y Factory

Este refactor migra el acoplamiento directo y genérico de red que residía en la aplicación principal (RetailCatalogNetworkApp) hacia un módulo independiente y reutilizable llamado NetworkCore, gestionado como un Git Submódulo.

La comunicación entre el proyecto principal y el submódulo se realiza estrictamente a través de Inversión de Dependencias (IoC) utilizando Factory, garantizando que la aplicación solo conozca contratos (Protocolos) y no implementaciones concretas de bajo nivel (URLSession).

<img width="736" height="402" alt="image" src="https://github.com/user-attachments/assets/663dad34-771b-4dbc-bac5-8ac6a2befdde" />
