<% ArrayList<MainOeuvre> mainOeuvres = (ArrayList<MainOeuvre>) request.getAttribute("mainOeuvres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Main d'oeuvre /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des mains d'oeuvre</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Style</th>
                                        <th>Ouvrier</th>
                                        <th>Heure du travail</th>
                                        <th>Nombre de personne</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(MainOeuvre mainOeuvre : mainOeuvres) { %>
                                    <tr>
                                        <td><%= mainOeuvre.getId() %></td>
                                        <td><%= mainOeuvre.getStyle().getNom() %></td>
                                        <td><%= mainOeuvre.getOuvrier().getNom() %></td>
                                        <td><%= mainOeuvre.getHeureTravail() %></td>
                                        <td><%= mainOeuvre.getNombrePersonne() %></td>
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
