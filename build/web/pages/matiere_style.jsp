<%@ page import="java.util.ArrayList, model.Style, model.Matiere" %>
<% ArrayList<Style> styles = (ArrayList<Style>) request.getAttribute("styles"); %>

<div class="container py-5">
    <div class="row mb-3">
        <div class="col-md-4">
            <h1>Rechercher les matieres selon le style</h1>
            <br>
            <form action="matiere-style" method="get" class="form-inline">
                <div class="form-group">
                    <select name="style" class="form-control mb-2">
                        <% for(Style style : styles) { %>
                            <option value="<%= style.getId() %>"><%= style.getNom() %></option>
                        <% } %>
                    </select>
                    <button type="submit" class="btn btn-primary">Valider</button>
                </div>
            </form>
        </div>
    </div>
    <% if(request.getAttribute("matieres") != null) { %>
    <% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <thead class="table-secondary">
                    <tr>
                        <th style="text-align: center;">Id</th>
                        <th style="text-align: center;">Nom de la matiere</th>
                    </tr>
                </thead>

                <tbody>
                    <% for(Matiere matiere : matieres) { %>
                    <tr>
                        <td><%= matiere.getId() %></td>
                        <td><%= matiere.getNom() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>
</div>