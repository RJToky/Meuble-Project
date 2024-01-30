<% ArrayList<Client> clients = (ArrayList<Client>) request.getAttribute("clients"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Client /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des clients</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du client</th>
                                        <th>Genre</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Client client : clients) { %>
                                    <tr>
                                        <td><%= client.getId() %></td>
                                        <td><%= client.getNom() %></td>
                                        <td><%= client.getGenre().getNom() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
