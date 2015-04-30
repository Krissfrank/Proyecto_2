import java.util.ArrayList;
import java.util.List;
import java.util.FileReader;
%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens = new ArrayList<>();
%}

%{
    public List<String> analizar(String archivo){
        File Reader in = null;
        try{
                in = new FileReader(archivo);
                Lexer lexer = new Lexer(in);
                while(!lexer.zzAtEOF)
                     {
                        lexer.yylex();
                     }
            }catch(Exeption ex)
                {
                    System.out.println("Error al analizar el archivo.");
                }finally
                    {

try{
    in.close();
    }catch(Exception ex){
         System.out.printf("Error al cerrar el archivo");

}
                        
                    }return tokens;
                }
%}
                    
