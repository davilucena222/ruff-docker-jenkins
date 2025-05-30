FROM python:3.11-slim AS static-config

# Instala ferramentas básicas e o Poetry
RUN apt-get update && apt-get install -y curl build-essential && \
    curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app

# Copia arquivos de dependências
COPY venvsetup.sh pyproject.toml poetry.lock ./
RUN ./venvsetup.sh


# Copia o restante da aplicação
COPY . .