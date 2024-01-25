<% ArrayList<Client> clients = (ArrayList<Client>) request.getAttribute("clients"); %>
<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>
<% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Vendre</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="vendre-meuble" method="post">
                        <div class="mb-3">
                            <label class="form-label">Client</label>
                            <select class="form-select" name="idClient" required="">
                                <option value="">Choisir...</option>
                                <% for (Client client : clients) { %>
                                <option value="<%= client.getId() %>"><%= client.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Meuble</label>
                            <select class="form-select" name="idMeuble" required="">
                                <option value="">Choisir...</option>
                                <% for (Meuble meuble : meubles) { %>
                                <option value="<%= meuble.getId() %>"><%= meuble.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Taille</label>
                            <select class="form-select" name="idTaille" required="">
                                <option value="">Choisir...</option>
                                <% for (Taille taille : tailles) { %>
                                <option value="<%= taille.getId() %>"><%= taille.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Quantite</label>
                            <input
                                type="number"
                                class="form-control"
                                name="quantite"
                                placeholder="5"
                                required=""
                                />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Date</label>
                            <input
                                type="date"
                                class="form-control"
                                name="dateVente"
                                required=""
                                />
                        </div>
                        <div>
                            <button type="submit" class="btn btn-success">Valider</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
