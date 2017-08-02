public with sharing class KenTestControllerMultiPage {





  public String data1 {get; set;}

  public String data2 {get; set;}

  public String data3 {get; set;}

   

    public KenTestControllerMultiPage () {

     data1 = 'one data';

     data2 = 'two data';

     data3 = 'three data';

     System.debug('xyzzy KenTestControllerMultiPage constructor');

 }

  

public PageReference step1() {

     System.debug('xyzzy step1');

     return Page.multipage;

 }

 public PageReference step2() {

     System.debug('xyzzy step2');

     return Page.multipage1;

 }

}