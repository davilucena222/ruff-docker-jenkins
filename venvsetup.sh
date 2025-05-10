#!/bin/bash
echo "Configurando ambiente virtual no container..."

# Força venv local no projeto
poetry config virtualenvs.in-project true

# Cria o venv e instala as dependências (sem instalar o pacote raiz)
poetry install --no-root

# Confirma se o ambiente foi criado
if [ -f .venv/bin/activate ]; then
    echo "Ambiente virtual criado com sucesso!"
    echo "Local do Python: $(realpath .venv/bin/python)"
else
    echo "Erro: .venv não foi criado."
    exit 1
fi