/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import org.junit.Test;
import static org.junit.Assert.*;
import junit.framework.TestCase;
import mx.uach.fing.compiladores.proyecto.analizadorlexicoparcial2.Token;

/**
 *
 * @author Cris
 */
public class TokenTest extends TestCase {

    public void testAtomo() {
        System.out.println("Prueba de atomo");
        Lexer analizar = Lexer.analizar("padre");
        Token token = analizar.tokens.get(0);
        assertEquals("atomo", token.token);
        
    }
    public void testfailAtomo() {
         System.out.println("Prueba de fallo atomo");
        Lexer analizar = Lexer.analizar("Aadre");
        Token token = analizar.tokens.get(0);
        
        assertNotSame("atomo", token.token);
    }

}
