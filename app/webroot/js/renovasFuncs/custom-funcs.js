//O Objeto Math => É um objeto predefinido, acessado diretamente sem uso de new ou outro método. Exemplo: Math.abs(y)
//abs => Retorna o valor absoluto de um número
//floor => Retorna o maior inteiro menor ou igual ao número dado. Por exemplo: para x = 30.75 retorna 30 e para x = -30.75 retorna -31.
//ceil => Retorna o menor inteiro maior ou igual ao número dado. Por exemplo: para x = 30.75 retorna 31 e para x = -30.75 retorna -30.
//toFixed(2) => O método toFixed() converte um número em uma string, mantendo um número especificado de casas decimais.  Ex: 55.76845 => 55.76845.(toFixed(2))

function calculaVenda(mlucro) {
    var valorCompra = $('#ProdutoValorCompra').val();

    if (!valorCompra || !mlucro) {
        alert('Não é possível realizar o cálculo, Valor de compra ou Margem de Lucro não foi definido');
        return;
    }
    //alert(valorCompra);
    valorCompra = setValor(valorCompra);
    mlucro = setValor(mlucro);

    var valorVenda = valorCompra * (mlucro / 100 + 1);
    //alert(valorVenda);
    valorVenda = Math.abs(valorVenda);

    $('#ProdutoValorVenda').val(valorVenda);
    $('#ProdutoValorVenda').maskMoney('mask', valorVenda);
    //$("#ProdutoValorVenda").maskMoney({prefix: 'R$ ', allowNegative: false, thousands: '.', decimal: ',', affixesStay: false});
}


//Funcao que acerta um valor para calculo
//ex: valor = 16,90 == 16.90
function setValor(x) {
    var newvalor = x.replace(",", ".");

    if (newvalor.length > 6) {
        newvalor = newvalor.replace(".", "");
    }

    newvalor = parseFloat(newvalor);

    return newvalor;
}

//Funcao que transforma valor monetário para exibição
function setValor_Display(y) {
    var newvalor = y.replace(",", ".");
    newvalor = parseFloat(newvalor);

    return newvalor;
}
