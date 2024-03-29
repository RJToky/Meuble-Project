<% ArrayList<Style> styles = (ArrayList<Style>) request.getAttribute("styles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Style /</span> Mati�res utilis�es</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des mati�res</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="style-matiere" method="get">
                            <div class="row d-flex align-items-end">
                                <div class="col-7 mb-3">
                                    <label class="form-label">Nom du style</label>
                                    <select class="form-select" name="idStyle" required="">
                                        <option value="">Choisir...</option>
                                        <% for (Style style : styles) { %>
                                        <% 
                                            boolean isSelected = false;
                                            int idStyle = 0;
                                            if(request.getAttribute("idStyle") != null) {
                                                idStyle = (int) request.getAttribute("idStyle");
                                                isSelected = (style.getId() == idStyle);
                                            }
                                        %>
                                        <option value="<%= style.getId() %>" <%= isSelected ? "selected" : "" %>><%= style.getNom() %></option>
                                        <% } %>
                                    </select>
                                </div>

                                <div class="col-auto ps-0 mb-3">
                                    <button type="submit" class="btn btn-primary">Lister</button>
                                </div>
                            </div>
                        </form> 
                    </div>

                    <% if(request.getAttribute("vDetailMatieres") != null) { %>
                    <% ArrayList<VDetailMatiere> vDetailMatieres = (ArrayList<VDetailMatiere>) request.getAttribute("vDetailMatieres"); %>
                    <div class="row mt-4">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de la matiere</th>
                                        <th>Prix unitaire actuel</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VDetailMatiere vDetailMatiere : vDetailMatieres) { %>
                                    <tr>
                                        <td><%= vDetailMatiere.getIdMatiere() %></td>
                                        <td><%= vDetailMatiere.getNomMatiere() %></td>
                                        <td><%= vDetailMatiere.getPrixUnitaire() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

        <% if(request.getAttribute("autresMatieres") != null) { %>
        <% ArrayList<Matiere> autresMatieres = (ArrayList<Matiere>) request.getAttribute("autresMatieres"); %>
        <div class="col-md-4">
            <div class="card mb-4">
                <h5 class="card-header">Ajouter autres mati�res pour ce style</h5>
                <div class="card-body">
                    <form  action="style-matiere" method="post">
                        <input type="hidden" name="idStyle" value="<%= request.getAttribute("idStyle") %>" />
                        <div class="mb-3">
                            <label class="form-label">Selectionner les matieres</label>
                            <div class="row">
                                <% for(Matiere matiere : autresMatieres) { %>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="idMatiere[]" value="<%= matiere.getId() %>" />
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
                            <% if(autresMatieres.size() == 0) { %>
                            <button type="submit" class="btn btn-success" disabled>Valider</button>
                            <% } else { %>
                            <button type="submit" class="btn btn-success">Valider</button>
                            <% } %>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

