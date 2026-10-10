import '../models/etiqueta.dart';
import '../models/nota.dart';
import '../models/proyecto.dart';

// ============================================================
// PROYECTOS
// ============================================================

final List<Proyecto> proyectosPrueba = [
  Proyecto(
    id: 'p1',
    nombre: 'Inteligencia artificial en la educación',
    descripcion:
    'Investigación sobre el uso de herramientas de inteligencia artificial para mejorar los procesos de enseñanza y aprendizaje.',
    fechaCreacion: DateTime(2026, 9, 1),
    fechaModificacion: DateTime(2026, 10, 5),
  ),

  Proyecto(
    id: 'p2',
    nombre: 'Aplicaciones móviles educativas',
    descripcion:
    'Análisis del desarrollo de aplicaciones móviles como apoyo al aprendizaje y acceso a recursos educativos.',
    fechaCreacion: DateTime(2026, 9, 5),
    fechaModificacion: DateTime(2026, 10, 4),
  ),

  Proyecto(
    id: 'p3',
    nombre: 'Ciberseguridad en aplicaciones',
    descripcion:
    'Estudio de las principales amenazas y medidas de seguridad utilizadas en aplicaciones móviles modernas.',
    fechaCreacion: DateTime(2026, 9, 10),
    fechaModificacion: DateTime(2026, 10, 6),
  ),
];

// ============================================================
// ETIQUETAS
// ============================================================

final List<Etiqueta> etiquetasPrueba = [
  Etiqueta(
    id_etiqueta: 'e1',
    nombre: 'Inteligencia Artificial',
    color: null,
  ),

  Etiqueta(
    id_etiqueta: 'e2',
    nombre: 'Educación',
    color: null,
  ),

  Etiqueta(
    id_etiqueta: 'e3',
    nombre: 'Tecnología',
    color: null,
  ),

  Etiqueta(
    id_etiqueta: 'e4',
    nombre: 'Metodología',
    color: null,
  ),

  Etiqueta(
    id_etiqueta: 'e5',
    nombre: 'Aplicaciones Móviles',
    color: null,
  ),

  Etiqueta(
    id_etiqueta: 'e6',
    nombre: 'Ciberseguridad',
    color: null,
  ),

  Etiqueta(
    id_etiqueta: 'e7',
    nombre: 'Investigación',
    color: null,
  ),

  // Etiqueta intencionalmente sin utilizar.
  Etiqueta(
    id_etiqueta: 'e8',
    nombre: 'Realidad Virtual',
    color: null,
  ),
];

// ============================================================
// NOTAS
// ============================================================

final List<Nota> notasPrueba = [

  // ==========================================================
  // PROYECTO 1
  // Inteligencia artificial en la educación
  // ==========================================================

  Nota(
    id_notas: 'n1',
    id_proyecto: 'p1',
    titulo: 'Uso de IA generativa en el aula',
    descripcion:
    'La inteligencia artificial generativa está comenzando a transformar diferentes actividades relacionadas con la educación. Herramientas capaces de generar texto, imágenes y otros contenidos pueden utilizarse como apoyo para explicar conceptos, crear ejercicios y proporcionar ejemplos adaptados a las necesidades de los estudiantes. Sin embargo, su incorporación también plantea nuevos retos relacionados con la evaluación, la autoría y la dependencia tecnológica. Por esta razón, el uso de estas herramientas debe estar acompañado de orientaciones claras por parte de los docentes y de criterios que permitan comprobar que los estudiantes comprenden realmente los contenidos trabajados. La IA no debe sustituir el proceso educativo, sino funcionar como una herramienta complementaria que facilite determinadas tareas y permita explorar nuevas formas de aprendizaje.',
    fecha_creacion: DateTime(2026, 9, 10),
    fecha_ult_mod: DateTime(2026, 10, 1),
    lista_etiquetas: ['e1', 'e2', 'e3'],
  ),

  Nota(
    id_notas: 'n2',
    id_proyecto: 'p1',
    titulo: 'Personalización del aprendizaje mediante IA',
    descripcion:
    'Los sistemas de inteligencia artificial pueden analizar determinados patrones relacionados con el aprendizaje de los estudiantes y utilizar esa información para recomendar contenidos o actividades. Esta posibilidad permite plantear modelos educativos más personalizados, donde los recursos disponibles se adapten progresivamente al nivel y ritmo de cada estudiante.',
    fecha_creacion: DateTime(2026, 9, 12),
    fecha_ult_mod: DateTime(2026, 10, 2),
    lista_etiquetas: ['e1', 'e2', 'e4'],
  ),

  Nota(
    id_notas: 'n3',
    id_proyecto: 'p1',
    titulo: 'Ventajas y riesgos de la inteligencia artificial',
    descripcion:
    'La utilización de inteligencia artificial en contextos educativos presenta ventajas importantes, pero también riesgos que deben analizarse. Entre sus beneficios se encuentran la automatización de determinadas tareas, la generación rápida de materiales y la posibilidad de ofrecer asistencia personalizada. Entre los riesgos aparecen la información incorrecta, los sesgos de los modelos y el uso excesivo de estas herramientas.',
    fecha_creacion: DateTime(2026, 9, 15),
    fecha_ult_mod: DateTime(2026, 10, 3),
    lista_etiquetas: ['e1', 'e7'],
  ),

  Nota(
    id_notas: 'n4',
    id_proyecto: 'p1',
    titulo: 'Evaluación del aprendizaje con herramientas digitales',
    descripcion:
    'La incorporación de herramientas digitales modifica algunas formas tradicionales de evaluación. Es necesario estudiar métodos que permitan comprobar los conocimientos adquiridos sin depender únicamente de actividades que puedan ser resueltas automáticamente por herramientas de inteligencia artificial.',
    fecha_creacion: DateTime(2026, 9, 18),
    fecha_ult_mod: DateTime(2026, 10, 5),
    lista_etiquetas: ['e2', 'e4', 'e7'],
  ),

  Nota(
    id_notas: 'n5',
    id_proyecto: 'p1',
    titulo: 'Experiencia de estudiantes con asistentes de IA',
    descripcion:
    'Los asistentes basados en inteligencia artificial pueden convertirse en herramientas de apoyo para estudiantes universitarios durante la realización de trabajos académicos. Su utilidad depende en gran medida de la forma en que se utilicen y de la capacidad del estudiante para evaluar críticamente las respuestas obtenidas. Un estudiante puede emplear un asistente para obtener ideas iniciales, organizar información o comprender un concepto complejo, pero posteriormente debe contrastar los resultados con fuentes académicas confiables. También resulta importante enseñar técnicas de formulación de preguntas y estrategias para identificar posibles errores en las respuestas generadas. Desde una perspectiva educativa, el objetivo no debería ser prohibir estas tecnologías, sino desarrollar competencias que permitan utilizarlas de manera responsable y crítica. Esto implica combinar el conocimiento tradicional de la materia con nuevas habilidades digitales.',
    fecha_creacion: DateTime(2026, 9, 20),
    fecha_ult_mod: DateTime(2026, 10, 5),
    lista_etiquetas: ['e1', 'e2', 'e7'],
  ),

  // ==========================================================
  // PROYECTO 2
  // Aplicaciones móviles educativas
  // ==========================================================

  Nota(
    id_notas: 'n6',
    id_proyecto: 'p2',
    titulo: 'Aplicaciones móviles como recurso educativo',
    descripcion:
    'Los dispositivos móviles forman parte de la vida cotidiana de muchos estudiantes, por lo que las aplicaciones educativas representan una alternativa interesante para complementar la enseñanza tradicional. Una aplicación puede facilitar el acceso a materiales, ejercicios y actividades desde diferentes lugares y horarios. Para que una aplicación tenga utilidad educativa no basta con presentar información, sino que debe ofrecer una experiencia clara y adecuada a los objetivos de aprendizaje. También es necesario considerar aspectos como la accesibilidad, el tamaño de las pantallas y las diferentes capacidades de los dispositivos. El diseño debe priorizar la facilidad de uso y evitar elementos innecesarios que puedan distraer al estudiante durante la actividad.',
    fecha_creacion: DateTime(2026, 9, 11),
    fecha_ult_mod: DateTime(2026, 10, 1),
    lista_etiquetas: ['e2', 'e3', 'e5'],
  ),

  Nota(
    id_notas: 'n7',
    id_proyecto: 'p2',
    titulo: 'Diseño de interfaces para estudiantes',
    descripcion:
    'Una interfaz educativa debe permitir que el estudiante encuentre rápidamente las funciones y contenidos que necesita. La organización visual, la jerarquía de información y el uso adecuado de componentes interactivos influyen directamente en la experiencia de usuario.',
    fecha_creacion: DateTime(2026, 9, 13),
    fecha_ult_mod: DateTime(2026, 10, 2),
    lista_etiquetas: ['e3', 'e5'],
  ),

  Nota(
    id_notas: 'n8',
    id_proyecto: 'p2',
    titulo: 'Usabilidad en aplicaciones educativas',
    descripcion:
    'La usabilidad es un factor fundamental en cualquier aplicación destinada al aprendizaje. Los usuarios deben poder completar las tareas principales sin realizar pasos innecesarios y deben recibir información clara cuando ocurre algún problema.',
    fecha_creacion: DateTime(2026, 9, 16),
    fecha_ult_mod: DateTime(2026, 10, 3),
    lista_etiquetas: ['e4', 'e5', 'e7'],
  ),

  Nota(
    id_notas: 'n9',
    id_proyecto: 'p2',
    titulo: 'Notificaciones y hábitos de estudio',
    descripcion:
    'Las notificaciones pueden utilizarse para recordar actividades pendientes, sesiones de estudio o fechas importantes. Sin embargo, un número excesivo de avisos puede generar distracciones y reducir la utilidad de la aplicación.',
    fecha_creacion: DateTime(2026, 9, 19),
    fecha_ult_mod: DateTime(2026, 10, 4),
    lista_etiquetas: ['e2', 'e5'],
  ),

  Nota(
    id_notas: 'n10',
    id_proyecto: 'p2',
    titulo: 'Arquitectura de una aplicación educativa',
    descripcion:
    'La arquitectura interna de una aplicación móvil determina cómo se organizan sus diferentes componentes y responsabilidades. Una estructura clara facilita el mantenimiento y permite incorporar nuevas funcionalidades sin modificar innecesariamente todo el proyecto. En aplicaciones educativas, esta organización es especialmente importante cuando existen diferentes tipos de contenidos, usuarios y procesos de interacción. Separar los modelos de datos, la lógica de estado y las interfaces facilita las pruebas y permite que cada parte pueda evolucionar de manera independiente. También resulta conveniente utilizar estructuras que permitan trabajar con datos en memoria durante las primeras etapas del desarrollo y posteriormente facilitar una posible integración con almacenamiento persistente. La arquitectura debe mantenerse sencilla cuando el proyecto es pequeño, evitando introducir tecnologías que no aporten una ventaja real para los requisitos planteados.',
    fecha_creacion: DateTime(2026, 9, 21),
    fecha_ult_mod: DateTime(2026, 10, 4),
    lista_etiquetas: ['e3', 'e5', 'e7'],
  ),

  // ==========================================================
  // PROYECTO 3
  // Ciberseguridad en aplicaciones
  // ==========================================================

  Nota(
    id_notas: 'n11',
    id_proyecto: 'p3',
    titulo: 'Principales amenazas en aplicaciones móviles',
    descripcion:
    'Las aplicaciones móviles están expuestas a diferentes amenazas de seguridad que pueden comprometer información personal y académica. Entre los problemas más frecuentes se encuentran el almacenamiento inseguro de información, las comunicaciones sin protección adecuada, el uso incorrecto de permisos y las vulnerabilidades en los mecanismos de autenticación. El desarrollo seguro debe comenzar desde las primeras etapas del proyecto y no limitarse a realizar pruebas cuando la aplicación ya está terminada. Es necesario analizar los datos que maneja la aplicación, determinar qué información necesita realmente y aplicar medidas de protección acordes con el nivel de riesgo. También resulta importante mantener actualizadas las dependencias utilizadas y revisar periódicamente el código para detectar posibles problemas.',
    fecha_creacion: DateTime(2026, 9, 12),
    fecha_ult_mod: DateTime(2026, 10, 2),
    lista_etiquetas: ['e3', 'e6', 'e7'],
  ),

  Nota(
    id_notas: 'n12',
    id_proyecto: 'p3',
    titulo: 'Protección de información personal',
    descripcion:
    'Las aplicaciones pueden manejar información personal que debe ser protegida durante todo su ciclo de vida. Para ello es necesario limitar la cantidad de datos almacenados, controlar quién puede acceder a ellos y utilizar mecanismos adecuados para proteger la información sensible.',
    fecha_creacion: DateTime(2026, 9, 15),
    fecha_ult_mod: DateTime(2026, 10, 3),
    lista_etiquetas: ['e6', 'e4'],
  ),

  Nota(
    id_notas: 'n13',
    id_proyecto: 'p3',
    titulo: 'Autenticación y control de acceso',
    descripcion:
    'Los mecanismos de autenticación permiten comprobar la identidad de un usuario antes de conceder acceso a determinadas funciones. Además de las contraseñas, existen mecanismos complementarios que pueden aumentar el nivel de protección de una aplicación.',
    fecha_creacion: DateTime(2026, 9, 18),
    fecha_ult_mod: DateTime(2026, 10, 4),
    lista_etiquetas: ['e6', 'e3'],
  ),

  Nota(
    id_notas: 'n14',
    id_proyecto: 'p3',
    titulo: 'Buenas prácticas de desarrollo seguro',
    descripcion:
    'El desarrollo seguro requiere aplicar buenas prácticas durante todo el proceso de creación de una aplicación. Revisar dependencias, validar entradas, proteger información sensible y evitar exponer datos innecesarios son algunas medidas que reducen la posibilidad de aparición de vulnerabilidades.',
    fecha_creacion: DateTime(2026, 9, 20),
    fecha_ult_mod: DateTime(2026, 10, 5),
    lista_etiquetas: ['e6', 'e7', 'e4'],
  ),

  // Nota sin ninguna etiqueta.
  Nota(
    id_notas: 'n15',
    id_proyecto: 'p3',
    titulo: 'Observaciones de la investigación',
    descripcion:
    'Esta nota contiene observaciones generales obtenidas durante la revisión inicial de diferentes aplicaciones móviles. Se utilizará para registrar información que todavía no ha sido clasificada dentro de una categoría específica.',
    fecha_creacion: DateTime(2026, 9, 22),
    fecha_ult_mod: DateTime(2026, 10, 6),
    lista_etiquetas: [],
  ),
];