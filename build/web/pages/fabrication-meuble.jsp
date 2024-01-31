<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Fabrication</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Choix meuble</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="fabrication-meuble" method="get">
                            <div class="row d-flex align-items-end">
                                <div class="col-7 mb-3">
                                    <label class="form-label">Nom du meuble</label>
                                    <select class="form-select" name="idMeuble" required="">
                                        <option value="">Choisir...</option>
                                        <% for (Meuble meuble : meubles) { %>
                                        <% 
                                            boolean isSelected = false;
                                            int idMeuble = 0;
                                            if(request.getAttribute("idMeuble") != null) {
                                                idMeuble = (int) request.getAttribute("idMeuble");
                                                isSelected = (meuble.getId() == idMeuble);
                                            }
                                        %>
                                        <option value="<%= meuble.getId() %>" <%= isSelected ? "selected" : "" %>><%= meuble.getNom() %></option>
                                        <% } %>
                                    </select>
                                </div>

                                <div class="col-auto ps-0 mb-3">
                                    <button type="submit" class="btn btn-primary">Choisir</button>
                                </div>
                            </div>
                        </form> 
                    </div>
                    <% if(request.getAttribute("tailles") != null) { %>
                    <% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>
                    <hr class="my-4">
                    <div class="row">
                        <h6 class="text-uppercase mb-3">Fabriquer ce meuble</h6>
                        <form class="col-7" action="fabrication-meuble" method="post">
                            <input type="hidden" name="idMeuble" value="<%= request.getAttribute("idMeuble") %>" />
                            <div class="mb-3">
                                <label class="form-label">Taille</label>
                                <select class="form-select" name="idTaille" required="">
                                    <option value="">Choisir...</option>
                                    <% for (Taille taille : tailles) { %>
                                    <option value="<%= taille.getId() %>"><%= taille.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Quantite</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    name="quantite"
                                    placeholder="5"
                                    required=""
                                    />
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Valider</button>
                            </div>
                        </form>
                    </div>
                    <% } %>
                </div>
            </div>

            <% if(request.getAttribute("formuleMeubles") != null && request.getAttribute("tailles") != null) { %>
            <% ArrayList<FormuleMeuble> formuleMeubles = (ArrayList<FormuleMeuble>) request.getAttribute("formuleMeubles"); %>
            <% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>
            <div class="card mb-4">
                <div class="card-body">
                    <% int i = 0; %>
                    <% for(Taille taille : tailles) { %>
                    <div class="row <% if(i == tailles.size() - 1) { out.print("mb-3"); } else { out.print("mb-5"); } %>">
                        <h6 class="text-uppercase">Taille <%= taille.getNom() %></h6>
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Matiere</th>
                                        <th>Quantite</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(FormuleMeuble formuleMeuble : formuleMeubles) { %>
                                    <% if(formuleMeuble.getTaille().getId() == taille.getId()) { %>
                                    <tr>
                                        <td><%= formuleMeuble.getMatiere().getId() %></td>
                                        <td><%= formuleMeuble.getMatiere().getNom() %></td>
                                        <td><%= formuleMeuble.getQuantite() %></td>
                                    </tr>
                                    <% } %>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <% i++; %>
                    <% } %>
                </div>
            </div>
            <% } %>
        </div>

        <% if(request.getAttribute("matieres") != null) { %>
        <% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>
        <% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>
        <div class="col-md-4">
            <div class="card mb-4">
                <h5 class="card-header">Fabrication</h5>
                <div class="card-body">
                    <form action="fabrication-meuble" method="post">
                        <input type="hidden" name="idMeuble" value="<%= request.getAttribute("idMeuble") %>" />
                        <div class="mb-3">
                            <label class="form-label">Taille</label>
                            <select class="form-select" name="idTaille" required="">
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
                                name="quantite-<%= matiere.getId() %>"
                                placeholder="Quantit�"
                                />
                        </div>
                        <% } %>
                        <div>
                            <button type="submit" class="btn btn-success">Valider</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
