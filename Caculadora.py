# Calculadora em Python
num1 = float(input("Digite o primeiro número: "))
num2 = float(input("Digite o segundo número: "))

operacao = input("Escolha a operação (+, -, *, /): ")

resultado = None

if operacao == '+':
    resultado = num1 + num2
elif operacao == '-':
    resultado = num1 - num2
elif operacao == '*':
    resultado = num1 * num2
elif operacao == '/':
    if num2 != 0:
        resultado = num1 / num2
    else:
        print("Erro: divisão por zero não é permitida.")
else:
    print("Operação inválida.")

if resultado is not None:
    print("Resultado:", resultado)

