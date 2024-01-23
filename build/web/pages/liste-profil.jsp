<% ArrayList<Profil> profils = (ArrayList<Profil>) request.getAttribute("profils"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Profil /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des profils</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de profil</th>
                                        <th>Annee</th>
                                        <th>Coefficient</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Profil profil : profils) { %>
                                    <tr>
                                        <td><%= profil.getId() %></td>
                                        <td><%= profil.getNom() %></td>
                                        <td><%= profil.getAnnee() %></td>
                                        <td><%= profil.getCoefficient() %></td>
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
