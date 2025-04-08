public class ContactService {
    public static void atualizarEmailParaContasAtivas(List<Contact> contatos) {
        // Coletar todos os AccountIds dos contatos
        Set<Id> accountIds = new Set<Id>();
        for (Contact c : contatos) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }

        // Buscar as contas com Status__c = 'Ativo'
        Map<Id, Account> contasAtivas = new Map<Id, Account>(
            [SELECT Id FROM Account WHERE Id IN :accountIds AND Status__c = 'Ativo']
        );

        List<Contact> contatosParaAtualizar = new List<Contact>();

        for (Contact c : contatos) {
            if (contasAtivas.containsKey(c.AccountId)) {
                String primeiro = c.FirstName != null ? c.FirstName.toLowerCase() : 'semnome';
                String sobrenome = c.LastName != null ? c.LastName.toLowerCase() : 'semsobrenome';
                c.Email = primeiro + '.' + sobrenome + '@empresa.com';
                contatosParaAtualizar.add(c);
            }
        }

        try {
            if (!contatosParaAtualizar.isEmpty()) {
                update contatosParaAtualizar;
            }
        } catch (Exception e) {
            System.debug('Erro ao atualizar emails: ' + e.getMessage());
        }
    }
}