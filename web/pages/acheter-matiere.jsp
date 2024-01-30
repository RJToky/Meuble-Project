<% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Matière /</span> Acheter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Acheter matière</h5>
                <div class="card-body">
                    <form action="acheter-matiere" method="post">
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
                            <label class="form-label">Quantite</label>
                            <input
                                type="number"
                                class="form-control"
                                name="quantite"
                                placeholder="Entrer la quantite"
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
