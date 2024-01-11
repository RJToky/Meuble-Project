<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Liste par valeur</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste par valeur</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="meuble-valeur" method="get">
                            <% 
                                boolean valeurMinIsSet = false;
                                boolean valeurMaxIsSet = false;
                                if(request.getAttribute("valeurMin") != null && request.getAttribute("valeurMax") != null) {
                                    valeurMinIsSet = true;
                                    valeurMaxIsSet = true;
                                }
                            %>
                            <div class="row d-flex align-items-end">
                                <div class="col-4 mb-3">
                                    <label class="form-label">Valeur min</label>
                                    <input
                                        type="number"
                                        class="form-control"
                                        name="valeurMin"
                                        placeholder="0"
                                        value="<%= valeurMinIsSet ? request.getAttribute("valeurMin") : "" %>"
                                        required
                                        />
                                </div>
                                <div class="col-4 ps-0 mb-3">
                                    <label class="form-label">Valeur max</label>
                                    <input
                                        type="number"
                                        class="form-control"
                                        name="valeurMax"
                                        placeholder="100000"
                                        value="<%= valeurMaxIsSet ? request.getAttribute("valeurMax") : "" %>"
                                        required
                                        />
                                </div>

                                <div class="col-auto ps-0 mb-3">
                                    <button type="submit" class="btn btn-primary">Lister</button>
                                </div>
                            </div>
                        </form> 
                    </div>

                    <% if(request.getAttribute("vMeubleValeurs") != null) { %>
                    <% ArrayList<VMeubleValeur> vMeubleValeurs = (ArrayList<VMeubleValeur>) request.getAttribute("vMeubleValeurs"); %>
                    <div class="row mt-4">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du meuble</th>
                                        <th>Taille</th>
                                        <th>Valeur</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VMeubleValeur vMeubleValeur : vMeubleValeurs) { %>
                                    <tr>
                                        <td><%= vMeubleValeur.getIdMeuble() %></td>
                                        <td><%= vMeubleValeur.getNomMeuble() %></td>
                                        <td><%= vMeubleValeur.getNomTaille() %></td>
                                        <td><%= vMeubleValeur.getValeur() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

