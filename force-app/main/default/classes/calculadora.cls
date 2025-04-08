public class calculadora {

    public Decimal soma(Decimal primeiroNumero, Decimal segundoNumero){
        
        return primeiroNumero + segundoNumero;
        
    }
    
    public Decimal subtracao(Decimal primeiroNumero, Decimal segundoNumero){
        
        return primeiroNumero - segundoNumero;
        
    }
    
    public Decimal multiplicacao(Decimal primeiroNumero, Decimal segundoNumero){
        
        return primeiroNumero * segundoNumero;
        
    }
    
    public Decimal divisao(Decimal primeiroNumero, Decimal segundoNumero){
        
        return primeiroNumero / segundoNumero;
        
    }

    public void calcular (Decimal primeiroNumero, Decimal segundoNumero, String Operacao){
        
        if(Operacao == 'Soma'){
            system.debug('Resultado da soma: ' + this.soma(primeiroNumero,segundoNumero));
        } else if (Operacao == 'Subtração'){
            system.debug('Resultado da subtração: ' + this.subtracao(primeiroNumero,segundoNumero));
    	} else if (Operacao == 'Multiplicação'){
            system.debug('Resultado da multiplicação: ' + this.multiplicacao(primeiroNumero,segundoNumero));
        } else if (Operacao == 'Divisão'){
            system.debug('Resultado da divisão: ' + this.divisao(primeiroNumero,segundoNumero));
        } else {
            system.debug('Operação não localizada!');
        }
	}
}