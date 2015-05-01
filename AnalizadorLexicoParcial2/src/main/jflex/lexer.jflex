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


[a-z][a-zA-Z0-9]+                               {tokens.add("atomo"); System.out.println("atomo");}
[^a-zA-Z0-9]+                                   {tokens.add("atomo"); System.out.println("atomo");}
"'"[a-zA-Z0-9]+|[^a-zA-Z0-9]+"'"                {tokens.add("atomo"); System.out.println("atomo");}
":-"                                            {tokens.add(":-"); System.out.println("Implica");}                
