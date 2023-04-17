package com.example.ejemplomvc.Controller;

import com.example.ejemplomvc.Modelo.Cliente;
import com.example.ejemplomvc.Service.ClientService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ClientServlet", value = "/ClientServlet")
public class ClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action)
        {
            case "findOne":
                findOne(request, response);
                break;
            case "findAll":
                findAll(request, response);
            case "delete":
                delete(request, response);
                findAll(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action)
        {
            case "save":
                save(request, response);
                findAll(request, response);
                break;
            case "update":
                update(request, response);
                findAll(request, response);
                break;
            default :
                findAll(request, response);
                break;
        }
    }

    public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClientService clientService = new ClientService();
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edad = request.getParameter("edad");
        String sexo = request.getParameter("sexo'");
        Cliente cliente = new Cliente(nombre,apellido,edad, sexo);
        clientService.save(cliente);
    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClientService clientService = new ClientService();
        List<Cliente> clientes = clientService.findAll();

        request.setAttribute("clients", clientes);
        request.getRequestDispatcher("View/home.jsp").forward(request, response);
    }

    public void findOne(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClientService clientService = new ClientService();
        String id = request.getParameter("id");
        Cliente cliente = clientService.findById(Long.parseLong(id));

        request.setAttribute("client", cliente);
        request.getRequestDispatcher("View/update.jsp").forward(request, response);
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClientService clientService = new ClientService();
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edad = request.getParameter("edad");
        String sexo = request.getParameter("sexo'");
        Cliente cliente = new Cliente(nombre,apellido,edad, sexo);
        cliente.setId(Integer.parseInt(id));
        clientService.update(cliente);

    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClientService clientService = new ClientService();
        String id = request.getParameter("id");
        clientService.delete(Long.parseLong(id));
    }
}
