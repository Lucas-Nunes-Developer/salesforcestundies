public class ContaAnaliseService {

    public static void gerarSinais() {
        // Buscar contas com AnnualRevenue > 500000
        List<Account> contasComReceitaAlta = [
            SELECT Id, Name
            FROM Account
            WHERE AnnualRevenue > 500000
        ];

        if (contasComReceitaAlta.isEmpty()) return;

        // Mapear contas para verificar oportunidades abertas
        Set<Id> contaIds = new Set<Id>();
        for (Account acc : contasComReceitaAlta) {
            contaIds.add(acc.Id);
        }

        // Buscar oportunidades abertas dessas contas
        Map<Id, List<Opportunity>> oportunidadesPorConta = new Map<Id, List<Opportunity>>();
        for (Opportunity opp : [
            SELECT Id, AccountId
            FROM Opportunity
            WHERE AccountId IN :contaIds
            AND StageName NOT IN ('Closed Won', 'Closed Lost')
        ]) {
            if (!oportunidadesPorConta.containsKey(opp.AccountId)) {
                oportunidadesPorConta.put(opp.AccountId, new List<Opportunity>());
            }
            oportunidadesPorConta.get(opp.AccountId).add(opp);
        }

        // Criar Conta_Relevante__c para contas sem oportunidades abertas
        List<Conta_Relevante__c> sinais = new List<Conta_Relevante__c>();

        for (Account acc : contasComReceitaAlta) {
            if (!opportunitiesPorConta.containsKey(acc.Id)) {
                sinais.add(new Conta_Relevante__c(
                    Name = 'Potencial - ' + acc.Name,
                    Conta__c = acc.Id,
                    Categoria__c = 'Alta Prioridade'
                ));
            }
        }

        insert sinais;
    }
}