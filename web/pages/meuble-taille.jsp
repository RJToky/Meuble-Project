<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Tailles utilisées</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste tailles utilisées</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="meuble-taille" method="get">
                            <div class="row d-flex align-items-end">
                                <div class="col-7 mb-3">
                                    <label class="form-label">Nom du meuble</label>
                                    <select class="form-select" name="idMeuble">
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
                                    <button type="submit" class="btn btn-primary">Lister</button>
                                </div>
                            </div>
                        </form> 
                    </div>

                    <% if(request.getAttribute("tailles") != null) { %>
                    <% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>
                    <div class="row mt-4">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de la taille</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Taille taille : tailles) { %>
                                    <tr>
                                        <td><%= taille.getId() %></td>
                                        <td><%= taille.getNom() %></td>
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

        <% if(request.getAttribute("autresTailles") != null) { %>
        <% ArrayList<Taille> autresTailles = (ArrayList<Taille>) request.getAttribute("autresTailles"); %>
        <div class="col-md-4">
            <div class="card mb-4">
                <h5 class="card-header">Ajouter autres tailles pour ce meuble</h5>
                <div class="card-body">
                    <form  action="meuble-taille" method="post">
                        <input type="hidden" name="idMeuble" value="<%= request.getAttribute("idMeuble") %>" />
                        <div class="mb-3">
                            <label class="form-label">Selectionner les tailles</label>
                            <div class="row">
                                <% for(Taille taille : autresTailles) { %>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="idTaille[]" value="<%= taille.getId() %>" />
                                            <label class="form-check-label">
                                                <%= taille.getNom() %>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>

                        <div>
                            <% if(autresTailles.size() == 0) { %>
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

