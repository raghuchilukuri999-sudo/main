public class Dog {

    public string breed;
    public string Color;
    public string age;
    
    public Dog(){
        system.debug('===The dog deatils');
    }
    public void barking(){
        system.debug('the dog barks');
    }
     public void sniffing(){
        system.debug('the dog sniffs');
    }
     public void biting(){
        system.debug('the dog bites');
    }
    public void display(){
        System.debug('The Name Of The Breed is' + breed);
        system.debug('====the dog Color is ' + Color );
        system.debug('====the dog age is ' +  age);
    }
 
}