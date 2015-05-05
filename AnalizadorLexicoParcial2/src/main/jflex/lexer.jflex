import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
import java.io.StringReader;
import mx.uach.fing.compiladores.proyecto.analizadorlexicoparcial2.Token;
%%
%public
%class Lexer
%standalone

%{
    public final List<Token> tokens = new ArrayList<>();
%}

%{
    public static Lexer analizar(String input){
System.out.println("Token   Lexema");        
Lexer lexer = null;
        try{
            StringReader in = new StringReader(input);
            lexer = new Lexer(in);
            while(!lexer.zzAtEOF){
                lexer.yylex();
            }
        }catch(Exception ex){
            System.out.println("Error al analizar el archivo.");
        }
        return lexer;
    }
%}
%%

[a-z]([a-zA-Z0-9]|"_")*                               {tokens.add(new Token("atomo", yytext())); System.out.printf("%s %s%n", "atomo", yytext());}
[^(a-zA-Z0-9)]+                                       {tokens.add(new Token("atomo", yytext())); System.out.println("atomo C2");}
"'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'"                  {tokens.add(new Token("atomo", yytext())); System.out.println("atomo C3");}
([A-Z]|"_")([a-zA-Z0-9]|"_")*                         {tokens.add(new Token("variable", yytext())); System.out.println("variable");}
("+"|"-"|"")[0-9]*"."[0-9]+                           {tokens.add(new Token("puntoFijo", yytext())); System.out.println("puntoFijo");}
":-"                                                  {tokens.add(new Token(":-", yytext())); System.out.println("implica");}
("+"|"-"|"")[0-9]+("e"|"E")[0-9]+                     {tokens.add(new Token("puntoFloat", yytext())); System.out.println("puntoFloat");}
\"([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\"                     {tokens.add(new Token("cadena", yytext())); System.out.println("cadena");}
("+"|"-"|"")[0-9]+                                    {tokens.add(new Token("entero", yytext())); System.out.println("entero");}
"["((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+)*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+ )*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*)","*)+"]" {tokens.add(new Token("lista", yytext())); System.out.println("lista");}
 
([a-z]([a-zA-Z0-9]|"_")*|[^(a-zA-Z0-9)]+|"'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")"("((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+  )*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+)*?(":-")*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(\"([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*?("["((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+)*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+ )*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*)","*)+"]")*)","*)+")"  {tokens.add(new Token("predicado", yytext())); System.out.println("predicado");}
"("                                                   {tokens.add(new Token("pizquierdo", yytext())); System.out.println("parentesisIzquierdo");}
")"                                                   {tokens.add(new Token("pdrecho", yytext())); System.out.println("parentesisderecho");}
"."                                                   {tokens.add(new Token("punto", yytext())); System.out.println("punto");}
","                                                   {tokens.add(new Token("coma", yytext())); System.out.println("coma");}
";"                                                   {tokens.add(new Token("puntoycoma", yytext())); System.out.println("puntoycoma");}

