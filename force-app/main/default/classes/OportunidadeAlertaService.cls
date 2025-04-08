public class OportunidadeAlertaService {

    public static void gerarAlertas() {
        // Buscar oportunidades que se encaixam no critério de risco
        List<Opportunity> oportunidadesRisco = [
            SELECT Id, Name 
            FROM Opportunity
            WHERE StageName = 'Proposal/Price Quote'
                AND Amount > 10000
                AND CloseDate <= :Date.today().addDays(7)
        ];

        if (oportunidadesRisco.isEmpty()) return;

        List<Alert__c> alertas = new List<Alert__c>();

        for (Opportunity opp : oportunidadesRisco) {
            Alert__c alerta = new Alert__c();
            alerta.Name = 'Risco de Perda - ' + opp.Name;
            alerta.Opportunity__c = opp.Id;
            alerta.Motivo__c = 'Alto valor e prazo curto';
            alertas.add(alerta);
        }

        insert alertas;
    }
}
