<% ArrayList<VEtatStockMeuble> vEtatStockMeubles = (ArrayList<VEtatStockMeuble>) request.getAttribute("vEtatStockMeubles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Etat stock</h4>

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
                                        <th>Meuble</th>
                                        <th>Taille</th>
                                        <th>Quantite</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VEtatStockMeuble vEtatStockMeuble : vEtatStockMeubles) { %>
                                    <tr>
                                        <td><%= vEtatStockMeuble.getIdMeuble() %></td>
                                        <td><%= vEtatStockMeuble.getMeuble().getNom() %></td>
                                        <td><%= vEtatStockMeuble.getTaille().getNom() %></td>
                                        <td><%= vEtatStockMeuble.getQuantite() %></td>
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
