<% ArrayList<Categorie> categories = (ArrayList<Categorie>) request.getAttribute("categories"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Categorie /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des categories</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de la categorie</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Categorie categorie : categories) { %>
                                    <tr>
                                        <td><%= categorie.getId() %></td>
                                        <td><%= categorie.getNom() %></td>
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
