<%@ page import="java.util.ArrayList, model.Matiere" %>
<% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>

<div class="container py-5">
    <h1>Insertion style</h1>
    <div class="row">
        <form class="col-lg-4 col-md-6" action="style" method="post">
            <div class="mb-3">
                <label class="form-label">Nom du style</label>
                <input
                    type="text"
                    class="form-control"
                    name="nom"
                    />
            </div>

            <div class="mb-3">
                <label class="form-label">Selectioner les matieres</label>
                <% for(Matiere matiere : matieres) { %>
                <div class="mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="idMatiere[]" value="<%= matiere.getId() %>">
                        <label class="form-check-label">
                            <%= matiere.getNom() %>
                        </label>
                    </div>
                </div>
                <% } %>
            </div>

            <div>
                <button type="submit" class="btn btn-primary w-100">Valider</button>
            </div>
        </form>
    </div>
</div>
