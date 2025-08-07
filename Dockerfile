FROM python:3.11-slim AS static-config

# Instala ferramentas básicas e o Poetry
RUN apt-get update && apt-get install -y curl build-essential && \
    curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /

# Copia arquivos de dependências
COPY pyproject.toml uv.lock ./

# Copia o restante da aplicação
COPY . .
