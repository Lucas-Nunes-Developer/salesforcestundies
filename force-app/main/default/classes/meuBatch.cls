global class meuBatch implements Database.Batchable<SObject>, Database.Stateful {

    // Exemplo de contador (mantém estado entre lotes)
    public Integer totalAtualizados = 0;

    // start: define os registros a processar
    global Database.QueryLocator start(Database.BatchableContext context) {
        String query = 'SELECT Id, Active__c FROM Account WHERE Active__c = \'YES\'';
        return Database.getQueryLocator(query);
    }

    // execute: lógica aplicada em cada lote
    global void execute(Database.BatchableContext context, List<Account> scope) {
        List<Account> contasParaAtualizar = new List<Account>();

        for (Account acc : scope) {
            acc.Active__c = 'NO';
            contasParaAtualizar.add(acc);
        }

        try {
            if (!contasParaAtualizar.isEmpty()) {
                update contasParaAtualizar;
                totalAtualizados += contasParaAtualizar.size();
            }
        } catch (Exception e) {
            System.debug('Erro ao atualizar contas: ' + e.getMessage());
        }
    }

    // finish: ação final após todos os lotes
    global void finish(Database.BatchableContext context) {
        String mensagem = 'Batch finalizado. Total de contas atualizadas: ' + totalAtualizados;
        System.debug(mensagem);

        // Exemplo: enviar e-mail de conclusão (opcional)
        /*
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] {'admin@empresa.com'});
        email.setSubject('Resumo do Batch Apex');
        email.setPlainTextBody(mensagem);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        */
    }
}
