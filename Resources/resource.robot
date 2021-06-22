*** Settings ***
Documentation    Testes web do e-commerce Petz
# declara a library
Library          SeleniumLibrary



*** Variables ***
${URL}        https://www.petz.com.br/
${product}    Spray bucal para gatos



#locators

${search_box}       search
${button_search}    button-search 





*** Keywords ***
Abrir o navegador
    Open Browser    browser=headlesschrome 
    Maximize Browser Window


Caso de teste 01: Buscar um produto
Dado que acesso o site Petz
    Go To    ${URL}
    Wait Until Element Is Visible    css=img.logo.img-responsive    10s


Quando busco pelo produto ${product}
    Input Text        id=${search_box}    ${product}
    Click Button      class=${button_search}
    
Então é exibido os resultados para ${product}
    Title Should Be        ${product} - Produtos pet em promoção | Petz


Caso de teste 02: Adicionar o produto ao carrinho

Dado que estou na página home
    Go To    ${URL}
    Wait Until Element Is Visible    css=img.logo.img-responsive    10s
    Click Button        id=aceiteLgpd

E pesquiso por "${product2}"
    Input Text        id=${search_box}    ${product2}
    Click Button      class=${button_search}
    
E seleciono o produto "'${kets_sand}'"
    Set Test Variable    ${kets_sand_locator}    //h3[contains(.,'Areia Higiênica Kets para Gatos')]
    Element Text Should Be    xpath=${kets_sand_locator}    ${kets_sand}  
    Click Element    xpath=${kets_sand_locator}


E adiciono o produto no carrinho
    Click Button            id=adicionarAoCarrinho


Então o produto é adiciona ao carrinho com sucesso 
    Wait Until Element Contains    css=th.minha-sacola    Meu Carrinho
  

