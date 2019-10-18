Dado("que tenha dados de um contato valido") do
  @contatos = Contatos.new
  @contatos.gerar_dados_contato
end

Quando("acionar o serviço de cadastro de contato") do
  @contatos.cadastrar_contato
end

Entao("recebo o codigo de retorno {int}") do |codigo|
    expect(@contatos.response_code).to eq codigo
end

Entao("a resposta das informacoes cadastradas com o ID") do
    expect(@contatos.response).not_to be_empty
end

Dado("que tenha dados de um contato já cadastrado") do
    @contatos = Contatos.new
    @contatos.gerar_dados_contato
    @contatos.cadastrar_contato
end

Entao("a mensagem {string}") do |mensagem|
   expect(@contatos.response).to have_content mensagem
end

Dado("que não preencha o {string} do contato") do |campo|
    @contatos = Contatos.new
    @contatos.gerar_dados_contato
    @contatos.cadastro_contato_campos_vazios(campo)
end

Entao("a {string} de erro do campo não preenchido") do |mensagem|
   expect(@contatos.response).to have_content mensagem
end

Quando("acionar o serviço de listar contatos") do
    @contatos = Contatos.new
    @contatos.listar_contatos
end
  
Entao("os dados dos contatos cadastrados") do
    expect(@contatos.response).not_to be_empty
end