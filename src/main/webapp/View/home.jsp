<%@ page import="java.util.List" %>
<%@ page import="com.example.ejemplomvc.Modelo.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
  <title>Clientes</title>
</head>
<body>

<div class="grid grid-cols-4 gap-4 mt-10">
  <%
    List<Cliente> clients = (List<Cliente>) request.getAttribute("clients");

    if (clients != null) {
      for (Cliente client : clients) {
        out.print("<div class='flex-col gap-3 shadow-lg p-3 rounded-md'>");

        out.print("<p class='text-purple-200 font-bold float-right'>" + client.getId() + "</p>");
        out.print("<p class='text-purple-500 font-bold'>" + client.getNombre() + "</p>");

        out.print("<div class='flex gap-3 p-2'>");
        out.print("<a href='../Controller/ClientServlet?action=findOne&id=" + client.getId() + "'>" +
                "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-pencil\" viewBox=\"0 0 16 16\">\n" +
                "  <path d=\"M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z\"/>\n" +
                "</svg>" +
                "</a> ");

        out.print("<a href='../Controller/ClientServlet?action=delete&id=" + client.getId() + "'>" +
                "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-trash3\" viewBox=\"0 0 16 16\">\n" +
                "  <path d=\"M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z\"/>\n" +
                "</svg>" +
                "</a> ");

        out.print("</div>");
        out.print("</div>");

      }
    }

  %>
</div>

<div class="mt-20 flex justify-center items-center">
  <form method="post" action="../Controller/ClientServlet?action=save" class="flex flex-col gap-3">
    <div class="flex flex-col justify-center items-center bg-[#000223] p-7 rounded-xl">
      <div class="flex justify-center items-center mb-5">
        <input type="text" name="nombre" id="nombre" placeholder="Nombre"
               class="focus:outline-none p-3 rounded-md mr-3">
        <input type="text" name="apellido" id="apellido" placeholder="Apellido"
               class="focus:outline-none p-3 rounded-md mr-3">
        <input type="text" name="edad" id="edad" placeholder="Edad"
               class="focus:outline-none p-3 rounded-md mr-3">
        <input type="text" name="sexo" id="sexo" placeholder="Sexo"
               class="focus:outline-none p-3 rounded-md mr-3">
      </div>
      <input type="submit" class="w-full py-2 rounded-md shadow-lg bg-[#027eff] text-white text-xl font-bold" value="Guardar">
    </div>
  </form>
</div>

</body>
</html>
