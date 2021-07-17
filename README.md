# criptonomia-front-end-test
Flutter application consuming endpoints and showing their responses on a UI, using clean architeture.

Pequena aplicação que utiliza da ferramenta Flutter para consumir 3 endpoints e mostrar ao usuário algumas informações. O teste soliciado mostrava 4 endpoints, mas não há necessidade de consumir o último, dado que todas as informações de todos os usuários são forneceidas na chamada do terceiro endpoint. 

Para que a aplicação seja rodada, é necessário ter o flutter pré instalado na máquina e um emulador Android ou mesmo um aparelho físico de mesmo Sistema Operacional. Maiores informações de como instalar podem ser obtidas pela documentação oficial do flutter, através do link https://flutter.dev/docs/get-started/install. 

A aplicação possui 4 telas, sendo 1 splash screen e 2 telas para posts e comentários, e 2 telas para usuários e detalhes de usuário. 

![image](https://user-images.githubusercontent.com/39418250/126050083-02d2c057-5069-44a8-8330-d14866e1ea44.png)

Exemplo da aplicação em uso acima. 

O código é escrito utilizando Arquitetura Limpa - ou Clean Architeture. Nas camadas de Domain e Data, defino as entidades necessárias que serão retornadas pelo endpoint. Além disso, os casos de uso das chamadas à API são descritos. Há um elevado grau de modularização visando maior manutenibilidade no futuro. Nas camadas Presentation e UI defino como serão formadas as telas e as funções que chamam as regras de negócio definidas nas camadas anteriores. Por fim, na camada Main toda as páginas são montadas. Alguns componentes extras são utilizados como pacotes HTTP, Providers e etc. Quaisquer dúvidas estou a disposição!
