<% ArrayList<Poste> postes = (ArrayList<Poste>) request.getAttribute("postes"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Poste /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-poste" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="Nom"
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
    
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Modifier taux horaire</h5>
                <div class="card-body">
                    <form action="ajouter-poste" method="post">
                        <div class="mb-3">
                            <label class="form-label">Poste</label>
                            <select class="form-select" name="idPoste" required="">
                                <option value="">Choisir...</option>
                                <% for (Poste poste : postes) { %>
                                <option value="<%= poste.getId() %>"><%= poste.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Valeur</label>
                            <input
                                type="number"
                                class="form-control"
                                name="valeur"
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
