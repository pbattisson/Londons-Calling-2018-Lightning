public class TextToSpeech {
    @future(callout=true)
    public static void convert(String eventId, String message) {
        HTTPRequest req = new HTTPRequest();
        String params = '?accept=audio/mp3&voice=en-US_AllisonVoice&text=' + EncodingUtil.URLEncode(message, 'UTF-8');
        req.setEndpoint('callout:Watson'+params);
        req.setMethod('GET');
		Http http = new Http();
    	HTTPResponse res = http.send(req);
        Document doc = new Document();
        doc.body = res.getBodyAsBlob();
        doc.Name = eventId + '.mp3';
        doc.FolderId = '00l0N000000S43z';
        doc.ContentType = 'audio/mp3';
        insert doc;
		EventBus.publish(new Audio__e(DocumentId__c = doc.Id));
    }
}