class Contatos
    include HTTParty
    headers 'Content-Type' => 'application/json; charset=UTF-8'
    format :json
    attr_accessor :body,
                  :response_code,
                  :id,
                  :response

    def gerar_dados_contato
       self.body = {
                    "name": "#{FFaker::NameBR.first_name}",
                    "last_name": "#{FFaker::NameBR.last_name}",
                    "email": "#{FFaker::Internet.email}",
                    "age": rand(18..100),
                    "phone": "#{Faker::PhoneNumber.phone_number}",
                    "address": "#{Faker::Address.street_name}",
                    "state": "#{Faker::Address.state}",
                    "city": "#{Faker::Address.city}"
                 }
    end


    def cadastrar_contato
        self.response = self.class.post("https://api-de-tarefas.herokuapp.com/contacts", body: self.body.to_json)
        self.response_code = self.response.code
    end


    def cadastro_contato_campos_vazios(campo)
        self.body["#{campo}"] = ""
    end

    
    def listar_contatos
        self.response = self.class.get("https://api-de-tarefas.herokuapp.com/contacts")
        self.response_code = self.response.code
    end
end