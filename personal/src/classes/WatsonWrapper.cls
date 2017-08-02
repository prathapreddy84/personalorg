public class WatsonWrapper {
  
    public static void consumeObject(JSONParser parser) {
    Integer depth = 0;
    do {
      JSONToken curr = parser.getCurrentToken();
      if (curr == JSONToken.START_OBJECT || 
        curr == JSONToken.START_ARRAY) {
        depth++;
      } else if (curr == JSONToken.END_OBJECT ||
        curr == JSONToken.END_ARRAY) {
        depth--;
      }
    } while (depth > 0 && parser.nextToken() != null);
  }

  public class Action {
    public String text {get;set;} 
    public String lemmatized {get;set;} 
    public Verb verb {get;set;} 

    public Action(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'lemmatized') {
              lemmatized = parser.getText();
            } else if (text == 'verb') {
              verb = new Verb(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Action consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Keywords {
    public Double relevance {get;set;} 
    public Sentiment sentiment {get;set;} 
    public String text {get;set;} 

    public Keywords(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'relevance') {
              relevance = parser.getDoubleValue();
            } else if (text == 'sentiment') {
              sentiment = new Sentiment(parser);
            } else if (text == 'text') {
              text = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Keywords consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Taxonomy {
    public String label {get;set;} 
    public Double score {get;set;} 
    public Boolean confident {get;set;} 

    public Taxonomy(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'label') {
              label = parser.getText();
            } else if (text == 'score') {
              score = parser.getDoubleValue();
            } else if (text == 'confident') {
              confident = parser.getBooleanValue();
            } else {
              System.debug(LoggingLevel.WARN, 'Taxonomy consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Object_Z {
    public String text {get;set;} 
    public Sentiment sentiment {get;set;} 
    public List<Subject> keywords {get;set;} 

    public Object_Z(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'sentiment') {
              sentiment = new Sentiment(parser);
            } else if (text == 'keywords') {
              keywords = new List<Subject>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                keywords.add(new Subject(parser));
              }
            } else {
              System.debug(LoggingLevel.WARN, 'Object_Z consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Object_Y {
    public String text {get;set;} 
    public Sentiment sentimentFromSubject {get;set;} 
    public List<Subject> keywords {get;set;} 

    public Object_Y(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'sentimentFromSubject') {
              sentimentFromSubject = new Sentiment(parser);
            } else if (text == 'keywords') {
              keywords = new List<Subject>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                keywords.add(new Subject(parser));
              }
            } else {
              System.debug(LoggingLevel.WARN, 'Object_Y consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Object_X {
    public String text {get;set;} 
    public Sentiment sentiment {get;set;} 
    public Sentiment sentimentFromSubject {get;set;} 

    public Object_X(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'sentiment') {
              sentiment = new Sentiment(parser);
            } else if (text == 'sentimentFromSubject') {
              sentimentFromSubject = new Sentiment(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Object_X consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Metadata {
    @AuraEnabled
    public String title {get;set;} 
    @AuraEnabled
    public String contentType {get;set;} 
    public String severity {get;set;} 

    public Metadata(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'title') {
              title = parser.getText();
            } else if (text == 'contentType') {
              contentType = parser.getText();
            } else if (text == 'severity') {
              severity = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Metadata consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Object_W {
    public String text {get;set;} 
    public Sentiment sentiment {get;set;} 

    public Object_W(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'sentiment') {
              sentiment = new Sentiment(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Object_W consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Object_V {
    public String text {get;set;} 
    public Sentiment sentiment {get;set;} 
    public List<Entities_Z> entities {get;set;} 
    public List<Subject> keywords {get;set;} 

    public Object_V(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'sentiment') {
              sentiment = new Sentiment(parser);
            } else if (text == 'entities') {
              entities = new List<Entities_Z>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                entities.add(new Entities_Z(parser));
              }
            } else if (text == 'keywords') {
              keywords = new List<Subject>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                keywords.add(new Subject(parser));
              }
            } else {
              System.debug(LoggingLevel.WARN, 'Object_V consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Object_U {
    public String text {get;set;} 
    public Sentiment sentimentFromSubject {get;set;} 

    public Object_U(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'sentimentFromSubject') {
              sentimentFromSubject = new Sentiment(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Object_U consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Watson {
    public Integer matching_results {get;set;} 
    @AuraEnabled
    public List<Results> results {get;set;} 

    public Watson(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'matching_results') {
              matching_results = parser.getIntegerValue();
            } else if (text == 'results') {
              results = new List<Results>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                results.add(new Results(parser));
              }
            } else {
              System.debug(LoggingLevel.WARN, 'Watson consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Action_Z {
    public String text {get;set;} 
    public String lemmatized {get;set;} 
    public Verb_Z verb {get;set;} 

    public Action_Z(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'lemmatized') {
              lemmatized = parser.getText();
            } else if (text == 'verb') {
              verb = new Verb_Z(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Action_Z consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Verb {
    public String text {get;set;} 
    public String tense {get;set;} 

    public Verb(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'tense') {
              tense = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Verb consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Verb_Z {
    public String text {get;set;} 
    public String tense {get;set;} 
    public String negated {get;set;} 

    public Verb_Z(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'tense') {
              tense = parser.getText();
            } else if (text == 'negated') {
              negated = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Verb_Z consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Relations {
    public String sentence {get;set;} 
    public Subject subject {get;set;} 
    public Action action {get;set;} 
    public Object_Z object_Z {get;set;} // in json: object
    public Subject location {get;set;} 

    public Relations(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'sentence') {
              sentence = parser.getText();
            } else if (text == 'subject') {
              subject = new Subject(parser);
            } else if (text == 'action') {
              action = new Action(parser);
            } else if (text == 'object') {
              object_Z = new Object_Z(parser);
            } else if (text == 'location') {
              location = new Subject(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Relations consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Sentiment_Z {
    public String type_Z {get;set;} // in json: type
    public Boolean mixed {get;set;} 

    public Sentiment_Z(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'type') {
              type_Z = parser.getText();
            } else if (text == 'mixed') {
              mixed = parser.getBooleanValue();
            } else {
              System.debug(LoggingLevel.WARN, 'Sentiment_Z consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Sentiment {
    public String type_Z {get;set;} // in json: type
    public Double score {get;set;} 
    public Boolean mixed {get;set;} 

    public Sentiment(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'type') {
              type_Z = parser.getText();
            } else if (text == 'score') {
              score = parser.getDoubleValue();
            } else if (text == 'mixed') {
              mixed = parser.getBooleanValue();
            } else {
              System.debug(LoggingLevel.WARN, 'Sentiment consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Subject {
    public String text {get;set;} 

    public Subject(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Subject consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Entities {
    public Integer count {get;set;} 
    public Sentiment sentiment {get;set;} 
    public String text {get;set;} 
    public Double relevance {get;set;} 
    public String type_Z {get;set;} // in json: type

    public Entities(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          system.debug('>>>>>1111'+text);
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'count') {
              count = parser.getIntegerValue();
            } else if (text == 'sentiment') {
              sentiment = new Sentiment(parser);
            } else if (text == 'text') {
              text = parser.getText();
            } else if (text == 'relevance') {
              relevance = parser.getDoubleValue();
            } else if (text == 'type') {
              type_Z = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Entities consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Entities_Z {
    public String type_Z {get;set;} // in json: type
    public String text {get;set;} 

    public Entities_Z(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'type') {
              type_Z = parser.getText();
            } else if (text == 'text') {
              text = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Entities_Z consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Enriched_text {
    public List<Entities> entities {get;set;} 
    public List<Taxonomy> taxonomy {get;set;} 
    public DocEmotions docEmotions {get;set;} 
    public List<Concepts> concepts {get;set;} 
    public String language {get;set;} 
    public String status {get;set;} 
    public List<Relations> relations {get;set;} 
    public List<Keywords> keywords {get;set;} 
    public Sentiment docSentiment {get;set;} 

    public Enriched_text(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT && parser.nextToken() != null) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          system.debug('>>>>>'+text);
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'entities') {
              entities = new List<Entities>();
              while (parser.nextToken() != JSONToken.END_ARRAY && parser.nextToken() != null) {
                entities.add(new Entities(parser));
              }
            } else if (text == 'taxonomy') {
              taxonomy = new List<Taxonomy>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                taxonomy.add(new Taxonomy(parser));
              }
            } else if (text == 'docEmotions') {
              docEmotions = new DocEmotions(parser);
            } else if (text == 'concepts') {
              concepts = new List<Concepts>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                concepts.add(new Concepts(parser));
              }
            } else if (text == 'language') {
              language = parser.getText();
            } else if (text == 'status') {
              status = parser.getText();
            } else if (text == 'relations') {
              relations = new List<Relations>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                relations.add(new Relations(parser));
              }
            } else if (text == 'keywords') {
              keywords = new List<Keywords>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                keywords.add(new Keywords(parser));
              }
            } else if (text == 'docSentiment') {
              docSentiment = new Sentiment(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Enriched_text consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Concepts {
    public String opencyc {get;set;} 
    public String dbpedia {get;set;} 
    public String text {get;set;} 
    public String freebase {get;set;} 
    public Double relevance {get;set;} 

    public Concepts(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'opencyc') {
              opencyc = parser.getText();
            } else if (text == 'dbpedia') {
              dbpedia = parser.getText();
            } else if (text == 'text') {
              text = parser.getText();
            } else if (text == 'freebase') {
              freebase = parser.getText();
            } else if (text == 'relevance') {
              relevance = parser.getDoubleValue();
            } else {
              System.debug(LoggingLevel.WARN, 'Concepts consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class DocEmotions {
    public String disgust {get;set;} 
    public String joy {get;set;} 
    public String anger {get;set;} 
    public String fear {get;set;} 
    public String sadness {get;set;} 

    public DocEmotions(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'disgust') {
              disgust = parser.getText();
            } else if (text == 'joy') {
              joy = parser.getText();
            } else if (text == 'anger') {
              anger = parser.getText();
            } else if (text == 'fear') {
              fear = parser.getText();
            } else if (text == 'sadness') {
              sadness = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'DocEmotions consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Results {
    @AuraEnabled
    public String id {get;set;} 
    public Double score {get;set;} 
    @AuraEnabled
    public Metadata metadata {get;set;} 
    @AuraEnabled
    public String body {get;set;} 
    @AuraEnabled
    public String text {get;set;} 
    public Enriched_text enriched_text {get;set;} 

    public Results(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'id') {
              id = parser.getText();
            } else if (text == 'score') {
              score = parser.getDoubleValue();
            } else if (text == 'metadata') {
              metadata = new Metadata(parser);
            } else if (text == 'body') {
              body = parser.getText();
            } else if (text == 'text') {
              text = parser.getText();
            } else if (text == 'enriched_text') {
              enriched_text = new Enriched_text(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Results consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  public class Subject_Z {
    public String text {get;set;} 
    public List<Subject> keywords {get;set;} 

    public Subject_Z(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT && parser.nextToken() != null) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'text') {
              text = parser.getText();
            } else if (text == 'keywords') {
              keywords = new List<Subject>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                keywords.add(new Subject(parser));
              }
            } else {
              System.debug(LoggingLevel.WARN, 'Subject_Z consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  
  public static Watson parse(String json) {
    return new Watson(System.JSON.createParser(json));
  }
}