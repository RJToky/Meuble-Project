<% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Style /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-style" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom du style</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Moderne"
                                required=""
                                />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Selectionner les matieres (optionnel)</label>
                            <div class="row">
                                <% for(Matiere matiere : matieres) { %>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="idMatiere[]" value="<%= matiere.getId() %>">
                                            <label class="form-check-label">
                                                <%= matiere.getNom() %>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
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
