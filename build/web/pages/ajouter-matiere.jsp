<% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Matière /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-matiere" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom de la matiere</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Plastique"
                                required=""
                                />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Prix unitaire (optionnel)</label>
                            <input
                                type="number"
                                class="form-control"
                                name="prixUnitaire"
                                placeholder="100000"
                                />
                        </div>
                        <div>
                            <button type="submit" class="btn btn-success">Valider</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Modifier prix</h5>
                <div class="card-body">
                    <form action="ajouter-matiere" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom de la matiere</label>
                            <select class="form-select" name="idMatiere" required="">
                                <option value="">Choisir...</option>
                                <% for (Matiere matiere : matieres) { %>
                                <option value="<%= matiere.getId() %>"><%= matiere.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Prix unitaire</label>
                            <input
                                type="number"
                                class="form-control"
                                name="prixUnitaire"
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
