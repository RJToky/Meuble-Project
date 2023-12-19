<% ArrayList<Style> styles = (ArrayList<Style>) request.getAttribute("styles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Liste par matières</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Liste par matières</h5>
                <div class="card-body">
                    <div class="row mb-4">
                        <form class="col-12" action="meuble-matiere" method="get">
                            <div class="row d-flex align-items-end">
                                <div class="col-7 mb-3">
                                    <label class="form-label">Nom du meuble</label>
                                    <select class="form-select" name="idMeuble">
                                        <option value="">Choisir...</option>
                                    </select>
                                </div>

                                <div class="col-auto ps-0 mb-3">
                                    <button type="submit" class="btn btn-primary">Lister</button>
                                </div>
                            </div>
                        </form> 
                    </div>

                    <% if(request.getAttribute("meubles") != null) { %>
                    <% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du meuble</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Meuble meuble : meubles) { %>
                                    <tr>
                                        <td><%= meuble.getId() %></td>
                                        <td><%= meuble.getNom() %></td>
                                        <td><a href="meuble-matiere" class="btn btn-info">Detail</a></td>
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
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Ajouter autres matières pour ce style</h5>
                <div class="card-body">
                    <form  action="matiere-style" method="post">
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

