<% ArrayList<Categorie> categories = (ArrayList<Categorie>) request.getAttribute("categories"); %>
<% ArrayList<Style> styles = (ArrayList<Style>) request.getAttribute("styles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-meuble" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom du meuble</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Canapé gigogne"
                                required=""
                                />
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Categorie</label>
                            <select class="form-select" name="idCategorie" required="">
                                <option value="">Choisir...</option>
                                <% for (Categorie categorie : categories) { %>
                                <option value="<%= categorie.getId() %>"><%= categorie.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                            
                        <div class="mb-3">
                            <label class="form-label">Style</label>
                            <select class="form-select" name="idStyle" required="">
                                <option value="">Choisir...</option>
                                <% for (Style style : styles) { %>
                                <option value="<%= style.getId() %>"><%= style.getNom() %></option>
                                <% } %>
                            </select>
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
    