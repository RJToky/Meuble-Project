<% ArrayList<Style> styles = (ArrayList<Style>) request.getAttribute("styles"); %>
<% ArrayList<Ouvrier> ouvriers = (ArrayList<Ouvrier>) request.getAttribute("ouvriers"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Main d'oeuvre /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-main-oeuvre" method="post">
                        <div class="mb-3">
                            <label class="form-label">Style</label>
                            <select class="form-select" name="idStyle" required="">
                                <option value="">Choisir...</option>
                                <% for (Style style : styles) { %>
                                <option value="<%= style.getId() %>"><%= style.getNom() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Poste</label>
                            <select class="form-select" name="idOuvrier" required="">
                                <option value="">Choisir...</option>
                                <% for (Ouvrier ouvrier : ouvriers) { %>
                                <option value="<%= ouvrier.getId() %>"><%= ouvrier.getNom() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Heure du travail</label>
                            <input
                                type="text"
                                class="form-control"
                                name="heureTravail"
                                placeholder="Heure du travail"
                                required=""
                                />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Nombre de personnes</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nombrePersonne"
                                placeholder="Nombre de personnes"
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
