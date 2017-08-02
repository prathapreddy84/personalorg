public class Logger {

    private String text = '';

    public void info(String message) {
        text += 'INFO:  ' + message + '\n';
    }

    public void error(String message) {
        text += 'ERROR: ' + message + '\n';
    }

    public void flush(String documentName) {

        Document[] docs = [select Body from Document where Name = :documentName];

        // Append if exists or create
        Document doc = docs.size() == 1
                ? docs[0]
                : new Document(
                        FolderId = UserInfo.getUserId(), // "My Personal Documents" folder
                        Name = documentName,
                        Body = Blob.valueOf(''),
                        ContentType = 'text/plain',
                        Type = 'txt'
                        );

        doc.Body = Blob.valueOf(doc.Body.toString() + text);
        upsert doc;

        text = '';
    }
}