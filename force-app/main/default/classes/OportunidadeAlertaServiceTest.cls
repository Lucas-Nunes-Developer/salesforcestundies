@isTest
private class OportunidadeAlertaServiceTest {

    @testSetup
    static void setup() {
        // Criar conta relacionada
        Account conta = new Account(Name = 'Empresa Teste');
        insert conta;

        // Criar oportunidade que se encaixa no critério
        Opportunity oppValida = new Opportunity(
            Name = 'Oportunidade com Risco',
            StageName = 'Proposal/Price Quote',
            Amount = 15000,
            CloseDate = Date.today().addDays(5),
            AccountId = conta.Id
        );

        // Criar oportunidade que NÃO se encaixa no critério
        Opportunity oppForaDoPadrao = new Opportunity(
            Name = 'Oportunidade Fora',
            StageName = 'Closed Won',
            Amount = 5000,
            CloseDate = Date.today().addDays(10),
            AccountId = conta.Id
        );

        insert new List<Opportunity>{ oppValida, oppForaDoPadrao };
    }

    @isTest
    static void deveCriarAlertasParaOportunidadesValidas() {
        Test.startTest();
        OportunidadeAlertaService.gerarAlertas();
        Test.stopTest();

        List<Alert__c> alertas = [SELECT Id, Name, Opportunity__c FROM Alert__c];
        System.assertEquals(1, alertas.size(), 'Deveria ter criado 1 alerta');
        System.assert(alertas[0].Name.contains('Risco de Perda'), 'Nome do alerta deveria conter "Risco de Perda"');
    }
}