/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pousada;

/**
 *
 * @author Aluno
 */
public class item {
    
              public String id; 
              public String nome;  
  
              public item(String id,String nome)
             {  
                        this.id = id;  
                        this.nome = nome;  
              }  

             @Override  
              public String toString(){  
                     return nome; 
}
}
