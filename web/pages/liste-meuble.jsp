<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des meubles</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du meuble</th>
                                        <th>Categorie</th>
                                        <th>Style</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Meuble meuble : meubles) { %>
                                    <tr>
                                        <td><%= meuble.getId() %></td>
                                        <td><%= meuble.getNom() %></td>
                                        <td><%= meuble.getCategorie().getNom() %></td>
                                        <td><%= meuble.getStyle().getNom() %></td>
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
