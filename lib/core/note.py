class Nota:
    def __init__(self, nombre, octava, afinacion_base=440):
        self.nombre = nombre
        self.octava = octava
        self.afinacion_base = afinacion_base
        self.frecuencia = self.calcular_frecuencia()

    def calcular_frecuencia(self):
        # Aquí pones la lógica de frecuencia basada en nombre y octava
        # Usando La4 = 440Hz como referencia
        return None
        # pasos_desde_la4 = calcular_semitonos(self.nombre, self.octava)
        # return self.afinacion_base * (2 ** (pasos_desde_la4 / 12))

    def subir_semitonos(self, n):
        # lógica para cambiar nombre/octava n semitonos arriba
        pass

    def bajar_semitonos(self, n):
        # lógica para cambiar nombre/octava n semitonos abajo
        pass

    def mostrar(self):
        return f"{self.nombre}{self.octava} - {self.frecuencia:.2f} Hz"
