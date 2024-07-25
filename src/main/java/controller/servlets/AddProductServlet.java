package controller.servlets;

import model.ProductModel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController;

    @Override
    public void init() throws ServletException {
        dbController = new DatabaseController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	String product_id = request.getParameter("product_id");
            String product_name = request.getParameter("product_name"); // Changed from Integer to String
            String availability_status = request.getParameter("availability_status");
            String stock_level = request.getParameter("stock_level");
            String category_id = request.getParameter("category_id");            
            String price = request.getParameter("price");
            String product_description = request.getParameter("product_description");



            ProductModel product = new ProductModel(product_id, product_name, availability_status, stock_level, category_id, price, product_description);
            int result = dbController.addProduct(product);

            if (result == 1) {
                response.sendRedirect("pages/Admin.jsp");
            } else {
                response.sendRedirect("pages/Admin.jsp");
            }
        } catch (NumberFormatException e) {
            System.err.println("Error converting strings to numbers: " + e.getMessage());
            response.sendRedirect("pages/Admin.jsp?error=NumberFormatException");
        } catch (Exception e) {
            System.err.println("Server error: " + e.getMessage());
            response.sendRedirect("pages/Admin.jsp?error=general");
        }
    }

}
