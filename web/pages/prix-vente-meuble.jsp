<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>
<% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Prix de vente</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="prix-vente-meuble" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom du meuble</label>
                            <select class="form-select" name="idMeuble">
                                <option value="">Choisir...</option>
                                <% for (Meuble meuble : meubles) { %>
                                <option value="<%= meuble.getId() %>"><%= meuble.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Taille</label>
                            <select class="form-select" name="idTaille">
                                <option value="">Choisir...</option>
                                <% for (Taille taille : tailles) { %>
                                <option value="<%= taille.getId() %>"><%= taille.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Prix de vente</label>
                            <input
                                type="text"
                                class="form-control"
                                name="number"
                                name="prixVente"
                                placeholder="100000"
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
