<% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Taille /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des tailles</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de la taille</th>
                                        <th>Coefficient</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Taille taille : tailles) { %>
                                    <tr>
                                        <td><%= taille.getId() %></td>
                                        <td><%= taille.getNom() %></td>
                                        <td><%= taille.getCoefficient() %></td>
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
