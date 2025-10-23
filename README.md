# 📊 Proyecto Integrador - Módulo 1: Análisis de Ventas

## 📋 Descripción del Proyecto

Este proyecto constituye un análisis integral del sistema de ventas de una empresa, abarcando desde consultas SQL avanzadas hasta análisis exploratorio de datos con Python. El objetivo es identificar patrones de ventas, optimizar consultas de base de datos y preparar datos para modelado predictivo.

---

## 🎯 Objetivos Principales

- **Análisis de productos y vendedores**: Identificar productos más vendidos y vendedores destacados
- **Optimización de consultas SQL**: Implementar índices y triggers para mejorar rendimiento
- **Análisis exploratorio con Python**: Detectar outliers, calcular métricas y preparar datos
- **Visualización de insights**: Comunicar hallazgos mediante gráficos claros

---

## 📂 Estructura del Repositorio
```
proyecto_1/
│
├── README.md                          # Documentación general del proyecto
├── datos/                             # Datasets utilizados
├── sql/                               
│   ├── avance1/                       # Consultas analíticas
│   │   ├── consultas.sql              # Scripts SQL
│   │   └── avance1.pdf                # Documentación con capturas de Workbench
│   └── avance2/                       # Triggers e índices
│       ├── triggers_indices.sql       # Scripts SQL
│       └── avance2.pdf                # Documentación con capturas de Workbench
├── python/                            
│   └── Avance3.ipynb                  # Análisis exploratorio con visualizaciones

```

---

## 🔍 Resumen de Avances

### 📌 Avance 1: Análisis SQL de Ventas

**Objetivo**: Identificar productos, vendedores y patrones de compra mediante consultas SQL avanzadas.

**Consultas realizadas:**
- Top 5 productos más vendidos y sus vendedores principales
- Análisis de clientes únicos por producto
- Proporción de productos dentro de categorías
- Ranking de productos por categoría usando funciones de ventana

**Hallazgos clave:**
- Devon Brewer destaca en 2 de los 5 productos más vendidos
- Ningún vendedor supera el 10% de ventas de su producto
- "Longos Chicken Wings" fue adquirido por el 14.8% de los clientes

📄 **Documentación detallada**: [Ver PDF Avance 1](./sql/avance1/avance1.pdf)  
💻 **Scripts SQL**: [Ver consultas](./sql/avance1/)

---

### 📌 Avance 2: Monitoreo y Optimización

**Objetivo**: Automatizar el monitoreo de ventas y optimizar el rendimiento de consultas.

**Implementaciones:**
- **Trigger de monitoreo**: Registra automáticamente productos que superan 200,000 unidades vendidas
- **Índices compuestos**: Mejoran significativamente el rendimiento en consultas con agregaciones y joins

**Resultados de optimización:**
- ✅ Reducción notable en tiempos de ejecución (ver EXPLAIN antes/después)
- ✅ Índices más efectivos en columnas numéricas con agregaciones

📄 **Documentación detallada**: [Ver PDF Avance 2](./sql/avance2/avance2.pdf)  
💻 **Scripts SQL**: [Ver triggers e índices](./sql/avance2/)

---

### 📌 Avance 3: Análisis Exploratorio con Python

**Objetivo**: Preparar y enriquecer el dataset para análisis avanzado y modelado.

**Transformaciones realizadas:**
- ✅ Cálculo de precio total real (corrección de columna `TotalPrice`)
- ✅ Detección de outliers mediante método IQR
- ✅ Clasificación temporal: ventas entre semana vs. fin de semana
- ✅ Cálculo de edad y experiencia de vendedores
- ✅ Preparación de dataset con variables dummy para modelado

**Insights principales:**
- Se detectaron **48,217 outliers** en ventas (0.71% del total)
- Las ventas "Entre semana" superan significativamente a las de fin de semana
- Dataset final listo con **29 variables** para modelado predictivo

📊 **Análisis completo**: [Ver Notebook](./python/Avance3.ipynb)

---

## 📊 Visualizaciones Principales

Las visualizaciones se encuentran integradas en el notebook de Python:

- 📈 Comparación de Ventas: Entre Semana vs. Fin de Semana
- 📉 Distribución de Ventas Totales
- 🔍 Análisis de Outliers

**Ver visualizaciones**: [Abrir Notebook Avance 3](./python/Avance3.ipynb)

---

## 🛠️ Tecnologías Utilizadas

| Tecnología | Versión | Uso |
|------------|---------|-----|
| **SQL** | MySQL 8.0 | Consultas, triggers e índices |
| **Python** | 3.x | Análisis exploratorio |
| **Pandas** | - | Manipulación de datos |
| **Matplotlib/Seaborn** | - | Visualizaciones |
| **Jupyter Notebook** | - | Entorno de desarrollo |
| **Git/GitHub** | - | Control de versiones |

---

## 🚀 Cómo Ejecutar el Proyecto

### Requisitos Previos
```bash
# Instalar dependencias de Python
pip install pandas numpy matplotlib seaborn jupyter
```

### 1️⃣ Ejecutar Scripts SQL
```sql
-- Conectar a MySQL
mysql -u usuario -p nombre_base_datos

-- Ejecutar scripts en orden
source sql/avance1/consultas.sql;
source sql/avance2/triggers_indices.sql;
```

### 2️⃣ Ejecutar Notebook de Python

**Opción A: Jupyter Notebook (local)**
```bash
jupyter notebook python/Avance3.ipynb
```

**Opción B: Plataformas en la nube**
- [Google Colab](https://colab.research.google.com/)
- [Kaggle Notebooks](https://www.kaggle.com/code)

> **Nota**: Asegúrate de subir los datasets de la carpeta `datos/` al entorno que elijas.

---

## 📈 Resultados y Conclusiones

Este proyecto demuestra:
- ✅ Dominio de consultas SQL avanzadas (ventanas, CTEs, agregaciones)
- ✅ Implementación efectiva de optimizaciones (índices, triggers)
- ✅ Capacidad de preparación de datos para modelado predictivo
- ✅ Comunicación clara de resultados mediante visualizaciones

---

## 👤 Autor

**Marcelo Adrián Sosa**

[![GitHub](https://img.shields.io/badge/GitHub-adriangoll-181717?style=flat&logo=github)](https://github.com/adriangoll)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Marcelo%20Adrian%20Sosa-0A66C2?style=flat&logo=linkedin)](https://www.linkedin.com/in/marcelo-adrian-sosa)

---

## 📝 Licencia

Este proyecto fue desarrollado como parte del curso [Ingeniería de Datos] - [SoyHenry].

---

⭐ **Si este proyecto te resultó útil, no olvides darle una estrella en GitHub!**