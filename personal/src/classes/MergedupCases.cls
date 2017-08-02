global class MergedupCases{
    webservice static void MergeCases(Id masterCaseId,Id dupid ) {
    case dupCase=[SELECT id from case where id=:dupid];
        // Duplicate all attachments
        List<Attachment> AttachmentsToBeCreated = new List<Attachment>();
        for (Attachment a : [SELECT Name, IsPrivate, Description, Body
                             FROM Attachment WHERE ParentId = :dupCase.Id AND IsDeleted=false]) {
            AttachmentsToBeCreated.add(new Attachment(ParentId = masterCaseId,
                                                      Name = a.Name,
                                                      IsPrivate = a.IsPrivate,
                                                      Description = a.Description,
                                                      Body = a.Body
                                                     ));
        }
 
        // Duplicate all comments
        List<CaseComment> CommentsToBeCreated = new List<CaseComment>();
        for (CaseComment cc : [SELECT IsPublished, CreatedDate, CommentBody FROM CaseComment
                               WHERE ParentId = :dupCase.Id AND IsDeleted=false]) {
            CommentsToBeCreated.add(new CaseComment(ParentId = masterCaseId,
                                                    IsPublished = cc.IsPublished,
                                                    CommentBody = 'This case comment was originally created on ' + cc.CreatedDate +
                                                                  ' and was merged into this case.\r\r' + cc.CommentBody
                                                   ));
        }
        if (!CommentsToBeCreated.IsEmpty())
            insert CommentsToBeCreated;
 
        // Duplicate all emails and attachments
      /*  List<EmailMessage> EmailsToBeCreated = new List<EmailMessage>();
       
        
        for (EmailMessage em : [SELECT FromName, FromAddress, ToAddress, ccAddress, bccAddress, Subject, TextBody,
                                       HtmlBody, MessageDate, Status, Incoming, Headers, ActivityId, HasAttachment
                                FROM EmailMessage WHERE ParentId = :dupCase.Id AND IsDeleted=false]) {
 
            string mergeNotice = 'This email was recreated when it\'s parent case was merged. ';
            
            // if the email has an attachment, recreate all the attachments with the parentid set to the case id
            if (em.HasAttachment) {
                for (Attachment att : [SELECT Name, IsPrivate, Description, Body
                                       FROM Attachment WHERE ParentId = :em.Id AND IsDeleted=false]) {
                    AttachmentsToBeCreated.add(new Attachment(ParentId = masterCaseId,
                                                              Name = att.Name,
                                                              IsPrivate = att.IsPrivate,
                                                              Body = att.Body,
                                                              Description = 'This attachment was originally attached to a merged email titled ' +
                                                                            em.Subject + '.\r\r' +
                                                                            ((att.Description != null) ? att.Description : '')
                                                             ));
                }
                mergeNotice += 'The original email attachments are now attached to the parent case.';
            }
            // now that the attachments are handled, add the actual email
            EmailsToBeCreated.add(new EmailMessage(ParentId = masterCaseId,
                                                   FromName = em.FromName,
                                                   FromAddress = em.FromAddress,
                                                   ToAddress = em.toAddress,
                                                   ccAddress = em.ccAddress,
                                                   bccAddress = em.bccAddress,
                                                   Subject = em.subject,
                                                   TextBody = ((em.TextBody != null) ? mergeNotice + '\r\rOriginal body:\r\r' + em.TextBody : null),
                                                   HtmlBody = ((em.HtmlBody != null) ? mergeNotice + 'Original body:' + em.HtmlBody : null),
                                                   MessageDate = em.MessageDate,
                                                   Status = em.Status,
                                                   Incoming = em.Incoming,
                                                   Headers = em.Headers,
                                                   ActivityId = em.ActivityId
                                                  ));
        }
        if (!EmailsToBeCreated.IsEmpty())
            insert EmailsToBeCreated;*/
 
        // change the whatid for all tasks
        List<Task> allTasks = [SELECT Id, WhatId FROM Task WHERE WhatId = :dupCase.Id AND IsDeleted=false];
        if (!allTasks.isEmpty()) {
            for (integer i = 0; i < allTasks.size(); i++)
                allTasks[i].WhatId = masterCaseId;
            update allTasks;
        }
 
        // change the whatid for all events
        List<Event> allEvents = [SELECT Id, WhatId FROM Event WHERE WhatId = :dupCase.Id AND IsDeleted=false];
        if (!allEvents.isEmpty()) {
            for (integer i = 0; i < allEvents.size(); i++)
                allEvents[i].WhatId = masterCaseId;
            update allEvents;
        }                          
 
        // duplicate all the attachments (of the case and related emails)
        if (!AttachmentsToBeCreated.IsEmpty())
            insert AttachmentsToBeCreated;
 
        // delete the original case and all it's related items
        delete dupCase;
    }
    
}