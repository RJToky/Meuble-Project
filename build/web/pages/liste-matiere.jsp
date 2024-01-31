<% ArrayList<VDetailMatiere> vDetailMatieres = (ArrayList<VDetailMatiere>) request.getAttribute("vDetailMatieres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Matiere /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des matieres</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de la matiere</th>
                                        <th>Prix unitaire actuel</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VDetailMatiere vDetailMatiere : vDetailMatieres) { %>
                                    <tr>
                                        <td><%= vDetailMatiere.getIdMatiere() %></td>
                                        <td><%= vDetailMatiere.getNomMatiere() %></td>
                                        <td><%= vDetailMatiere.getPrixUnitaire() %></td>
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
