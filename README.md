# Teste de conhecimento técnico - Dimensa

O objetivo do projeto é realizar um teste de avaliação de conhecimento. Na ocasião, foi requisitada a elaboração de um Web crawler para extrair informações do site http://quotes.toscrape.com/ utilizando as seguintes tecnologias:

- Ruby on Rails
- Sidekiq
- MongoDB

### Instalação e configuração ###

Para obter uma cópia da aplicação, utilize o seguinte comando:
```
git clone https://github.com/PauloHoring/dimensa_test.git
```

Uma vez no diretório do projeto clonado, execute o seguinte comando no terminal:
```
bundle install
```

Inicie o seu MongoDB e Redis da maneira que está configurado no seu ambiente. Seja por docker container ou instalação local.

Por último, para iniciar o projeto, execute o seguinte comando no terminal:
```
rails s
```

### Funcionamento ###

Utilize a plataforma de API para desenvolvedores (Insomnia, Postman, Thunder Client, etc...) para realizar uma requisição GET conforme abaixo:
http://localhost:3000/quotes/{SEARCH_TAG}

Espera-se receber um JSON, conforme exemplificado abaixo:

```
{
    "quotes": [
        {
            "quote": string,
            "author": string,
            "author_about": string,
            "tags": array
        }
    ]
}
```

### Soluções adotadas para o desafio ###

Utilizando meus conhecimentos recentes em API com Ruby on Rails, implementei a solução proposta no teste. Foi essencial realizar estudos suplementares sobre as gems Nokogiri, Sidekiq e Sidekiq-Cron. Estas bibliotecas desempenharam um papel crucial na execução do crawler e no desenvolvimento do job associado.

No âmbito do banco de dados, foi necessário adquirir informações adicionais sobre o comportamento específico do MongoDB, dado meu conhecimento prévio limitado.

A implementação da autenticação utilizando JWT foi facilitada pelo conhecimento já adquirido em cursos recentemente concluídos.
