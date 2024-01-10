<% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Liste par matières</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste par matières</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="meuble-matiere" method="get">
                            <div class="row d-flex align-items-end">
                                <div class="col-7 mb-3">
                                    <label class="form-label">Nom de la matiere</label>
                                    <select class="form-select" name="idMatiere" required="">
                                        <option value="">Choisir...</option>
                                        <% for (Matiere matiere : matieres) { %>
                                        <% 
                                            boolean isSelected = false;
                                            int idMatiere = 0;
                                            if(request.getAttribute("idMatiere") != null) {
                                                idMatiere = (int) request.getAttribute("idMatiere");
                                                isSelected = (matiere.getId() == idMatiere);
                                            }
                                        %>
                                        <option value="<%= matiere.getId() %>" <%= isSelected ? "selected" : "" %>><%= matiere.getNom() %></option>
                                        <% } %>
                                    </select>
                                </div>

                                <div class="col-auto ps-0 mb-3">
                                    <button type="submit" class="btn btn-primary">Lister</button>
                                </div>
                            </div>
                        </form> 
                    </div>

                    <% if(request.getAttribute("fabricationMeubles") != null) { %>
                    <% ArrayList<FabricationMeuble> fabricationMeubles = (ArrayList<FabricationMeuble>) request.getAttribute("fabricationMeubles"); %>
                    <div class="row mt-4">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du meuble</th>
                                        <th>Categorie</th>
                                        <th>Style</th>
                                        <th>Taille</th>
                                        <th>Quantite</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(FabricationMeuble fabricationMeuble : fabricationMeubles) { %>
                                    <tr>
                                        <td><%= fabricationMeuble.getIdMeuble() %></td>
                                        <td><%= fabricationMeuble.getMeuble().getNom() %></td>
                                        <td><%= fabricationMeuble.getMeuble().getCategorie().getNom() %></td>
                                        <td><%= fabricationMeuble.getMeuble().getStyle().getNom() %></td>
                                        <td><%= fabricationMeuble.getTaille().getNom() %></td>
                                        <td><%= fabricationMeuble.getQuantite() %></td>
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
    </div>
</div>

