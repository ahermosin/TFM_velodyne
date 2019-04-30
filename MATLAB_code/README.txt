FIGURAS
Los archivos .fig se pueden abrir directamente con MATLAB para poder ampliar tanto como se desee. Los archivos .png no tienen mucha resolución, pero sirven para ilustraciones.




INTERPRETACIÓN
Las cruces son elementos que se identifican como verticales.
  Las cruces rojas son elementos que tienen propiedades verticales pero no cumplen con todas las restricciones
  Las cruces verdes son elementos que satisfacen las restricciones de verticalidad
  
Los círculos denotan dónde están los elementos de interés.
  Los círculos azules (pequeños) indican los puntos que caen dentro del área en torno a la cual se encuentran realmente los objetos (ground truth)
  Los círculos negros (grandes) se muestran simplemente a efectos de visualización, para que se vea desde lejos dónde están los elementos de interés




SCRIPT
La variable 'count' es una matriz nx4, siendo n el número de elementos verticales de interés en cada escenario, y siendo las columnas lo siguiente:
  Columna 1: Identificaciones correctas de un elemento vertical de interés (suma puntos)
  Columna 2: Falsos negativos de un elemento vertical de interés (resta puntos)
  Columna 3: Total de identificaciones (correctas y erróneas) = Col 1 - Col 2
  Columna 4: Puntuación del elemento = Col 1 + Col 2. Es deseable que sea positivo y lo más cercano a Col 1 como sea posible.
