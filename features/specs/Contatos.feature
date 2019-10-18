# encoding: utf-8
# language: pt

@testes
Funcionalidade: Cadastro e manutenção da Lista de contatos

Cenario: Cadastrar contato com dados válidos
    Dado que tenha dados de um contato valido
    Quando acionar o serviço de cadastro de contato
    Entao recebo o codigo de retorno 201
    E a resposta das informacoes cadastradas com o ID

Cenario: Cadastrar contato já cadastrado no sistema
    Dado que tenha dados de um contato já cadastrado
    Quando acionar o serviço de cadastro de contato
    Entao recebo o codigo de retorno 422
    E a mensagem "já está em uso"

Esquema do Cenario: Criar contato com o campos obrigatorios não preenchidos
    Dado que não preencha o <campo> do contato
    Quando acionar o serviço de cadastro de contato
    Entao recebo o codigo de retorno 422
    E a <mensagem> de erro do campo não preenchido

    Exemplos:
          | campo   | mensagem                    |
          | 'name'  | 'não pode ficar em branco'  |
          | 'email' | 'não pode ficar em branco'  |
          | 'age'   | 'não é um número'           |
          | 'phone' | 'não é válido'              |

Cenario: Listar contatos cadastrados
    Quando acionar o serviço de listar contatos
    Entao recebo o codigo de retorno 200
    E os dados dos contatos cadastrados
  