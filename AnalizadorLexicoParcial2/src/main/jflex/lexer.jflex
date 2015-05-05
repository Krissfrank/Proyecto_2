import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens = new ArrayList<>();
%}

%{
    public List<String> analizar(String archivo){
        FileReader in = null;
        try{
            in = new FileReader(archivo);
            Lexer lexer = new Lexer(in);
            while(!lexer.zzAtEOF){
                lexer.yylex();
            }
        }catch(Exception ex){
            System.out.println("Error al analizar el archivo.");
        }finally{
            try{
                in.close();
            }catch(Exception ex){
                System.out.println("Error al cerrar el archivo.");
            }
        }return tokens;
    }
%}

%%

[a-z]([a-zA-Z0-9]|"_")*                               {tokens.add("atomo"); System.out.println("atomo Regla 1");}
"'"([a-zA-Z0-9]*[^(a-zA-Z0-9\s)]*)+"'"                {tokens.add("atomo"); System.out.println("atomo Regla 2");}
([^(a-zA-Z0-9\s)][^(a-zA-Z0-9\s)](^":-") )+                   {tokens.add("atomo"); System.out.println("atomo Regla 3");}
([A-Z]|"_")([a-zA-Z0-9]|"_")*                         {tokens.add("variable"); System.out.println("variable");}
("+"|"-"|"")[0-9]*"."[0-9]+                           {tokens.add("puntoFijo"); System.out.println("puntoFijo");}
":-"                                                  {tokens.add(":-"); System.out.println("implica");}
("+"|"-"|"")[0-9]+("e"|"E")[0-9]+                     {tokens.add("puntoFloat"); System.out.println("puntoFloat");}
\"([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\"                     {tokens.add("cadena"); System.out.println("cadena");}
("+"|"-"|"")[0-9]+                                    {tokens.add("entero"); System.out.println("entero");}
"["((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+)*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+ )*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*?(([a-z]([a-zA-Z0-9]|"_")*|[^(a-zA-Z0-9)]+|"'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")"("((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+)*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+)*?(":-")*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(\"([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*?("["((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+)*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+ )*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*)","*)+"]")*)","*)+")")*)","*)+"]"     {tokens.add("lista"); System.out.println("lista");}
([a-z]([a-zA-Z0-9]|"_")*|[^(a-zA-Z0-9)]+|"'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")"("((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+  )*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+)*?(":-")*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(\"([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*?("["((([a-z]([a-zA-Z0-9]|"_")*)*?([^(a-zA-Z0-9)]+)*?("'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'")*?(([A-Z]|"_")([a-zA-Z0-9]|"_")*)*?(("+"|"-"|"")[0-9]*"."[0-9]+ )*?(("+"|"-"|"")[0-9]+("e"|"E")[0-9]+)*?(([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\")*?(("+"|"-"|"")[0-9]+)*)","*)+"]")*)","*)+")"  {tokens.add("predicado"); System.out.println("predicado");}

"("                                                   {tokens.add("parentesisIzquiero"); System.out.println("parentesisIzquierdo");}
")"                                                   {tokens.add("parentesisDerecho"); System.out.println("parentesisDerecho");}
","                                                   {tokens.add("coma"); System.out.println("coma");}
";"                                                   {tokens.add("puntoComa"); System.out.println("puntoComa");}
"."                                                   {tokens.add("punto"); System.out.println("punto");}
