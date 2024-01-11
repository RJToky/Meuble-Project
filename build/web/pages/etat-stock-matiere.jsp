<% ArrayList<VEtatStockMatiere> vEtatStockMatieres = (ArrayList<VEtatStockMatiere>) request.getAttribute("vEtatStockMatieres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Matiere /</span> Etat stock</h4>

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
                                        <th>Matiere</th>
                                        <th>Quantite</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VEtatStockMatiere vEtatStockMatiere : vEtatStockMatieres) { %>
                                    <tr>
                                        <td><%= vEtatStockMatiere.getId() %></td>
                                        <td><%= vEtatStockMatiere.getNomMatiere() %></td>
                                        <td><%= vEtatStockMatiere.getQuantite() %></td>
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
