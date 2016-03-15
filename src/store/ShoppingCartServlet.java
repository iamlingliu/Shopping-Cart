package store;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

/* User: Peter  Date: 04.10.13  Time: 12:57 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute(ShoppingCart.ATTRIBUTE_NAME);
        
        if (cart == null) {
        	System.out.println("session is null");
        	request.getSession().setAttribute(ShoppingCart.ATTRIBUTE_NAME, new ShoppingCart());
        	cart = (ShoppingCart) session.getAttribute(ShoppingCart.ATTRIBUTE_NAME);
        }
        else System.out.println("session is not null");
          
        //just added new param
        String id =  request.getParameter("productID");
        
        
        if (id != null) {
        	System.out.println("id is not null");
        	try{
            cart.addProduct(id, 1);
        	}catch(Exception ex) {
        		ex.printStackTrace();
        	}
        } else {
        	System.out.println("i am here");
            Enumeration<String> params = request.getParameterNames();
            ShoppingCart newCart = new ShoppingCart();
            while(params.hasMoreElements()){
                id = params.nextElement();
                System.out.println("id" + id);
                System.out.println("id param" + request.getParameter(id));
                newCart.addProduct(id, request.getParameter(id), cart.getQuantityOf(id));
            }
            cart = newCart;
        }

        session.setAttribute(ShoppingCart.ATTRIBUTE_NAME, cart);

        RequestDispatcher rd = request.getRequestDispatcher("shopping-cart.jsp");
        rd.forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}