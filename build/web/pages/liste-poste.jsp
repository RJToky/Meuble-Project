<% ArrayList<VDetailPoste> vDetailPostes = (ArrayList<VDetailPoste>) request.getAttribute("vDetailPostes"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Poste /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des postes</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du poste</th>
                                        <th>Taux horaire actuel</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VDetailPoste vDetailPoste : vDetailPostes) { %>
                                    <tr>
                                        <td><%= vDetailPoste.getIdPoste() %></td>
                                        <td><%= vDetailPoste.getNomPoste() %></td>
                                        <td><%= vDetailPoste.getTauxHoraire() %></td>
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
    