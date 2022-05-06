# ea-2021-1-cc51
## Objetivo del trabajo
Limpiar el dataset que contiene información sobre las reservas de hoteles para luego obtener visualizaciones que permitan identificar correlaciones y estadísticas que permitan tomar decisiones sobre la base del giro del negocio.
## Integrantes
* Basauri Quispe, Roberto Carlos - U20181C074
* Bravo Navarro, Rebeca Liliana - U201711448 
* González Vidalón, Ian Steve - U202021767
## Descripción del dataset
El caso de análisis del presente trabajo es un dataset modificado de la demanda de dos hoteles de distinto tipo de la ciudad de Lisboa.  Contiene información sobre cada reserva realizada entre el 1 de julio del 2015 y el 31 de agosto del 2017. El dataset original fue extraído de la base de datos del sistema de gestión de propiedades (PMS). <br>
La información presente es importante la identificación de nichos dentro del segmento de los mercados hoteleros, asimismo, para evaluar la viabilidad de instanciar un hotel de alguno de los siguientes tipos:<br>
* Resort: establecimiento de servicio completo destinado principalmente a vacacionistas.<br>
* Urbano: son establecimientos cuyo propósito estándar es el de brindar alojamiento confortable.<br>
Con dicha información estos nichos podrían hacer una gestión de ingresos por demanda para evaluar la posibilidad de la realización de algún tipo de hotel.<br>
Para el desarrollo de este proyecto se buscará sintetizar la información del dataset con el objetivo de:<br>
* Analizar las preferencias de los consumidores según tipo de hotel. (Tendencia de elección).<br>
* Evaluar la sostenibilidad de cada tipo de hotel al transcurrir el tiempo.<br>
* Clasificar las temporadas de consumo según tipo de hotel.<br>
* Conocer la relevancia de los espacios de estacionamiento según la demanda de los mismos.<br>
* Evaluar la tendencia a cancelar citas según temporada.<br>
## Conclusiones
* Se realiza una mayor cantidad de reservas para los hoteles de ciudad, que agrupan el 61.5% de las reservas totales concretadas aproximadamente.
* La demanda aumentó entre los años 2015 y 2016, mas mostró una tendencia hacia la disminución entre los años 2016 y 2017. Ambas tendencias se observan tanto para los hoteles Resort como para los hoteles de ciudad, aunque las pendientes son más empinadas para el de ciudad, lo cual muestra que el pico que experimentó en 2016 fue más significativo. Esto indica que se debe identificar qué factores llevaron al año 2016 a ser tan exitoso, para replicarlos y volver a obtener esas altas cantidades de reservas.
* La temporada baja comprende los meses de diciembre a febrero, es decir, el invierno europeo.
* La temporada de reserva alta se presenta en los meses de marzo a julio, que coincide con la primavera y verano europeos.
* La temporada de reserva media se da entre los meses de agosto a noviembre.
* El hotel de ciudad tiene más reservas con niños mientras que el hotel Resort tiene más reservas para bebés. No obstante, en ambos es una cantidad bastante baja, teniendo como máximo 4618, de un total de aproximadamente 75000 registros (luego de excluir las cancelaciones). De modo que no sería muy viable realizar campañas o modificaciones en la infraestructura para optimizar la experiencia de los pequeños, a no ser que el objetivo sea aumentar significativamente la demanda de estos sectores demográficos.
* La cantidad de reservas que no pidieron espacios de estacionamiento es mucho más grande que el caso contrario, de modo que se concluye que no es muy relevante invertir en más espacios de estacionamiento ni buscar mejorar los existentes.
* Los meses con mayor cantidad de cancelaciones son mayo, junio, julio y agosto, lo cual coincide hasta cierto punto con los meses de mayor demanda, de modo que se puede lógicamente concluir que los meses con mayor demanda son también los meses cuando más se cancela. También hay que tomar en cuenta que del año 2015 solo se posee data desde julio, lo cual puede influenciar las estadísticas y explicar por qué otros meses de alta demanda como marzo, abril, mayo y junio no están presentes.
