import syntaxtree.*;
import visitor.*;

public class A3 {
   public static void main(String [] args) {
      try {
         Node root = new MiniJavaParser(System.in).Goal();
         // System.out.println("Program parsed successfully");
         root.accept(new GJDepthFirst(), null); // Your assignment part is invoked here.
         // System.out.println("Program type checked successfully");
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 

