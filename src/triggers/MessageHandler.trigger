trigger MessageHandler on Message__e (after insert) {
	List<Message__e> inputs = (List<Message__e>)trigger.new;
    List<String> messages = new List<String>();
    for(Message__e msg: inputs) {
        System.debug(msg.input__c);
        TextToSpeech.convert(msg.ReplayId, msg.input__c);
    }
}