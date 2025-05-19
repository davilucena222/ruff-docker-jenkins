import os  # F401: importação não usada

def soma(a, b):
    resultado = a + b  # F841: variável atribuída mas nunca usada
    return total  # F821: uso de variável não definida

resultado =soma(5,3 )
print(f"A soma é: {resultado}")
