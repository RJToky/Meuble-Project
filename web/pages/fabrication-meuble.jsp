<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Fabrication</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Choix meuble</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="fabrication-meuble" method="get">
                            <div class="row d-flex align-items-end">
                                <div class="col-7 mb-3">
                                    <label class="form-label">Nom du meuble</label>
                                    <select class="form-select" name="idMeuble">
                                        <option value="">Choisir...</option>
                                        <% for (Meuble meuble : meubles) { %>
                                        <option value="<%= meuble.getId() %>"><%= meuble.getNom() %></option>
                                        <% } %>
                                    </select>
                                </div>

                                <div class="col-auto ps-0 mb-3">
                                    <button type="submit" class="btn btn-primary">Choisir</button>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>

        <% if(request.getAttribute("matieres") != null) { %>
        <% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>
        <% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Fabrication</h5>
                <div class="card-body">
                    <form action="fabrication-meuble" method="post">
                        <input type="hidden" name="idMeuble" value="<%= request.getAttribute("idMeuble") %>" />
                        <div class="mb-3">
                            <label class="form-label">Taille</label>
                            <select class="form-select" name="idTaille">
                                <option value="">Choisir...</option>
                                <% for (Taille taille : tailles) { %>
                                <option value="<%= taille.getId() %>"><%= taille.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <% for (Matiere matiere : matieres) { %>
                        <div class="mb-3">
                            <label class="form-label"><%= matiere.getNom() %></label>
                            <input type="hidden" name="idMatiere[]" value="<%= matiere.getId() %>" />
                            <input
                                type="number"
                                class="form-control"
                                name="quantite[]"
                                placeholder="Quantité"
                                required
                                />
                        </div>
                        <% } %>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
