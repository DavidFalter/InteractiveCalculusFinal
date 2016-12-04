package InteractiveCalculus.Main;

import java.util.ArrayList;

import java.util.List;

import DataStructureElements.*;
import Parser.Parser;
import Utilities.Derive;
import Utilities.Integrate;
import Utilities.Stringifier;

/**
 *
 * @author gillis
 */
public class Controller {
    
    public Integral solveIntegral(String s){
	Expression i;
	Integrate.clearSteps();
	Expression e = Parser.parseString(s);
	if (e != null){
		i = Integrate.integrate(e);
	}
	else {
		i = new Constant(0);
	}
	Integral in = new Integral();
	
        if ((e == null) || (e instanceof Constant && ((Constant)e).getValue() == 0 && !s.equals("0"))){
            List<String> l = new ArrayList<>();
            in.setOrignal("0");
            in.setIntegral("0");
            l.add("Input read error.");
            in.setSteps(l);
        }
        else{
            in.setOrignal(s);
            in.setIntegral(Stringifier.stringify(i));
            if (i instanceof Constant && ((Constant)i).getValue() == 0){
                List<String> l = new ArrayList<>();
                l.add("Program is unable to take the integral of this expression.");
                in.setSteps(l);
            }
            else {
                in.setSteps(Integrate.getSteps());
            }
        }
        
	return in;
    }
    
    public Derivative solveDerivative(String s){
	Expression d;
	Derive.clearSteps();
	Expression e = Parser.parseString(s);
	if (e != null){
		d = Derive.derive(e);
	}
	else {
		d = new Constant(0);
	}
        Derivative ddx = new Derivative();
        
        if ((e == null) || (e instanceof Constant && ((Constant)e).getValue() == 0 && !s.equals("0"))){
            List<String> l = new ArrayList<>();
            ddx.setOrignal(s);
            ddx.setDerivative("0");
            l.add("Input read error.");
            ddx.setSteps(l);
        }
        else{        
            ddx.setOrignal(s);
            ddx.setDerivative(Stringifier.stringify(d));
            if (d instanceof Constant && ((Constant)d).getValue() == 0 && !(e instanceof Constant)){
                List<String> l = new ArrayList<>();
                l.add("Program is unable to take the derivative of this expression.");
                ddx.setSteps(l);
            }
            else{
                ddx.setSteps(Derive.getSteps());
            }
        }
        
	return ddx;
    }

		

		public Original getOriginal(String string)
		{
			String equation = string;

			Original original = new Original();
			
			original.setOriginalEquation(equation);
			
			return original;
		}


}