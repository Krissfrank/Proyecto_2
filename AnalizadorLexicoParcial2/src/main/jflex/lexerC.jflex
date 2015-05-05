import java.util.ArrayList;
import java.util.List;
import java.io.StringReader;
%%
%public
%class Lexer
%standalone

%{
    public final List<Token> tokens = new ArrayList<>();
%}

%{
    public static Lexer analizar(String input){
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