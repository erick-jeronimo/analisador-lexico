package analisador;

import java.io.File;
import java.nio.file.Paths;

public class Gerador {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/";

        String file = rootPath + subPath + "linguagem.flex";
		
		File sourceCode = new File(file);
		jflex.Main.generate(sourceCode);
	}

}
