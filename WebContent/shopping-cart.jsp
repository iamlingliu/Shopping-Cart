<%@ page import="java.math.BigDecimal" %>
<%@ page import="store.ShoppingCart" %>
<%@ page import="store.DataManager" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private String liDecorator(DataManager.Product product, int quantityOf) {
        return "<li> <input type ='number' value='" + quantityOf + "' name='" + product.id + "'>"
                + product.name + ", " + product.price + "</li>";
    }
%>
<%
    BigDecimal total = new BigDecimal(0);
    ShoppingCart cart = (ShoppingCart) session.getAttribute(ShoppingCart.ATTRIBUTE_NAME);
    DataManager dm = (DataManager) application.getAttribute(DataManager.ATTRIBUTE_NAME);
    ArrayList<DataManager.Product> products = new ArrayList<DataManager.Product>();
    if (cart.getProductIDs().size() > 0) {
    	products = dm.getProductsList(cart.getProductIDs());
    }
    System.out.println(products.size());
%>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>

<h1>Shopping Cart</h1>

<form action="ShoppingCartServlet" method="post">
    <ul>
        <%
            for (DataManager.Product product : products) {
                int quantityOfItems = cart.getQuantityOf(product.id);
                total = total.add(product.price.multiply(new BigDecimal(quantityOfItems)));
                out.print(liDecorator(product, quantityOfItems));
            }
        %>
    </ul>
    Total: $ <%= total %> <input type="submit" value="Update Cart"/>
</form>
<a href="./index.jsp">Continue shopping</a>
</body>
</html>