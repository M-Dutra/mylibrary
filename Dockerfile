# 1. Base Ruby
FROM ruby:3.1.2

# 2. Instalar dependências e uma versão recente do Node.js (v18)
RUN apt-get update -qq && apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

RUN npm install --global yarn

# 3. Definir pasta de trabalho
WORKDIR /app

# 4. Copiar Gemfile primeiro (Truque de performance: o Docker faz cache das gems se o Gemfile não mudar)
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 5. Copiar package.json e yarn.lock
COPY package.json yarn.lock ./
RUN yarn install

# 6. Copiar o resto da aplicação
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# 7. Expor porta e comando
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
