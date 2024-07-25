package controller.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DatabaseController;
import model.ProductModel;

@WebServlet(asyncSupported = true, urlPatterns = { "/SearchProductServlet" })
public class SearchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName").trim();
        String priceStr = request.getParameter("unitPrice").trim();
        Integer price = null;

        if (productName.isEmpty() && priceStr.isEmpty()) {
            request.setAttribute("products", null);
        } else {
            if (!priceStr.isEmpty()) {
                try {
                    price = Integer.parseInt(priceStr);
                } catch (NumberFormatException e) {
                    // If the number is not valid, consider handling it differently or logging it
                }
            }

            DatabaseController dbController = new DatabaseController();
            List<ProductModel> products = dbController.getProductsByNameAndPrice(productName, price);
            request.setAttribute("products", products);
        }

        request.getRequestDispatcher("pages/ProductListing.jsp").forward(request, response);
    }
}
