# --- ETAPA 1: Builder ---
FROM ruby:3.1.2-slim AS builder

RUN apt-get update -qq && apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    git \
    && npm install --global yarn

WORKDIR /app

# Copiamos Gemfile e instalamos TUDO (necessário para dev)
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Instalamos JS
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

# --- ETAPA 2: Final ---
FROM ruby:3.1.2-slim

RUN apt-get update -qq && apt-get install -y ca-certificates curl gnupg

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update -qq && apt-get install -y \
    libpq5 \
    nodejs \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiamos as gems da etapa anterior
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
