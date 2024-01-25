<% ArrayList<Genre> genres = (ArrayList<Genre>) request.getAttribute("genres"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Client /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-client" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom du client</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Rakoto"
                                required=""
                                />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Genre</label>
                            <select class="form-select" name="idGenre" required="">
                                <option value="">Choisir...</option>
                                <% for (Genre genre : genres) { %>
                                <option value="<%= genre.getId() %>"><%= genre.getNom() %></option>
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
