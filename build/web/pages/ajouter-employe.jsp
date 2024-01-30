<% ArrayList<Employe> employes = (ArrayList<Employe>) request.getAttribute("employes"); %>
<% ArrayList<Ouvrier> ouvriers = (ArrayList<Ouvrier>) request.getAttribute("ouvriers"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Employe /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-employe" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom de l'employe</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Rakoto"
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
                <h5 class="card-header">Embaucher</h5>
                <div class="card-body">
                    <form action="ajouter-employe" method="post">
                        <div class="mb-3">
                            <label class="form-label">Employe</label>
                            <select class="form-select" name="idEmploye" required="">
                                <option value="">Choisir...</option>
                                <% for (Employe employe : employes) { %>
                                <option value="<%= employe.getId() %>"><%= employe.getNom() %></option>
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
                            <label class="form-label">Date</label>
                            <input
                                type="date"
                                class="form-control"
                                name="dateEmbauche"
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
