<% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Taille /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-taille" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom de la taille</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : GM"
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
                <h5 class="card-header">Ajouter ordre</h5>
                <div class="card-body">
                    <form action="ajouter-taille" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom du meuble</label>
                            <select class="form-select" name="idTaille" required="">
                                <option value="">Choisir...</option>
                                <% for(Taille taille : tailles) { %>
                                <option value="<%= taille.getId() %>"><%= taille.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ordre</label>
                            <input
                                type="number"
                                class="form-control"
                                name="ordre"
                                placeholder="Ordre"
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
