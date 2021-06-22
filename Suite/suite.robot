*** Settings ***
Documentation     Testes web do e-commerce Petz

Resource          ../Resources/resource.robot
Suite Setup       Abrir o navegador
Suite Teardown    Close All Browsers



*** Test Cases ***



Caso de teste 01: Buscar um produto
  
    Dado que acesso o site Petz
    Quando busco pelo produto ${product}    
    Então é exibido os resultados para ${product}



Caso de teste 02: Adicionar o produto ao carrinho

    Dado que estou na página home
    E pesquiso por "Areia Kets"
    E seleciono o produto "'Areia Higiênica Kets para Gatos'"
    E adiciono o produto no carrinho
    Então o produto é adiciona ao carrinho com sucesso 


 Caso de teste 03: Produto indisponível
     No Operation


Caso de teste 04: 
    No Operation


Caso de teste 05:
    No Operation   
