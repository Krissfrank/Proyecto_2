/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.uach.fing.compiladores.proyecto.analizadorlexicoparcial2;

/**
 *
 * @author Abelardo
 */
public class Token {
    
    final String token;
    final String lexema;

    public Token(String token, String lexema) {
        this.token = token;
        this.lexema = lexema;}
    
}
