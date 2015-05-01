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


[a-z]([a-zA-Z0-9]|"_")*                               {tokens.add("atomo"); System.out.println("atomo C1");}
[^(a-zA-Z0-9)]+                                       {tokens.add("atomo"); System.out.println("atomo C2");}
"'"([a-zA-Z0-9]*|[^(a-zA-Z0-9)])*"'"                  {tokens.add("atomo"); System.out.println("atomo C3");}
([A-Z]|"_")([a-zA-Z0-9]|"_")*                         {tokens.add("variable"); System.out.println("variable");}
("+"|"-"|"")[0-9]*"."[0-9]+                           {tokens.add("puntoFijo"); System.out.println("puntoFijo");}
":-"                                                  {tokens.add(":-"); System.out.println("implica");}
("+"|"-"|"")[0-9]+("e"|"E")[0-9]+                     {tokens.add("puntoFloat"); System.out.println("puntoFloat");}
\"([a-zA-Z0-9]|[^(a-zA-Z0-9)])+\"                     {tokens.add("cadena"); System.out.println("cadena");}
