public with sharing class Controllertojavascriptcontroller {
    public String Name {get; set;}
    public string scriptvar{get;set;}
    public Controllertojavascriptcontroller() {
            Name='Sudhir Dudeja';
    }
    public void func(){
        //We would call javascript from here this apex function
        scriptvar='<script> func(); </script>';
    }
}