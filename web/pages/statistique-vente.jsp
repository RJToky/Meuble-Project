<% ArrayList<Meuble> meubles = (ArrayList<Meuble>) request.getAttribute("meubles"); %>
<% ArrayList<Taille> tailles = (ArrayList<Taille>) request.getAttribute("tailles"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Statistique /</span> Vente</h4>

    <div class="row">
        <div class="col-md-7">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="statistique-vente" method="get">
                        <div class="row d-flex align-items-end">
                            <div class="col-5 mb-3">
                                <label class="form-label">Meuble</label>
                                <select class="form-select" name="idMeuble" required="">
                                    <option value="0">Tous</option>
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
                            <div class="col-5 px-0 mb-3">
                                <label class="form-label">Taille</label>
                                <select class="form-select" name="idTaille" required="">
                                    <option value="0">Tous</option>
                                    <% for (Taille taille : tailles) { %>
                                    <% 
                                        boolean isSelected = false;
                                        int idTaille = 0;
                                        if(request.getAttribute("idTaille") != null) {
                                            idTaille = (int) request.getAttribute("idTaille");
                                            isSelected = (taille.getId() == idTaille);
                                        }
                                    %>
                                    <option value="<%= taille.getId() %>" <%= isSelected ? "selected" : "" %>><%= taille.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="col-auto mb-3">
                                <button type="submit" class="btn btn-primary">Voir</button>
                            </div>
                        </div>
                    </form>

                    <% if(request.getAttribute("vStatistiqueVentes") != null) { %>
                    <% ArrayList<VStatistiqueVente> vStatistiqueVentes = (ArrayList<VStatistiqueVente>) request.getAttribute("vStatistiqueVentes"); %>
                    <div class="row mt-4">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Genre</th>
                                        <th>Nombre de vente</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VStatistiqueVente vStatistiqueVente : vStatistiqueVentes) { %>
                                    <tr>
                                        <td><%= vStatistiqueVente.getNomGenre() %></td>
                                        <td><%= vStatistiqueVente.getNombreVente() %></td>
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

        <% if(request.getAttribute("vStatistiqueVentes") != null) { %>
        <% ArrayList<VStatistiqueVente> vStatistiqueVentes = (ArrayList<VStatistiqueVente>) request.getAttribute("vStatistiqueVentes"); %>
        <div class="col-md-5">
            <div class="card mb-4">
                <h5 class="card-header">Graphique</h5>
                <div class="card-body d-flex justify-content-center align-items-center">
                    <div>
                        <canvas id="chart" width="250px"></canvas>
                    </div>
                    <%
                        StringBuilder labels = new StringBuilder("[");
                        StringBuilder data = new StringBuilder("[");

                        for (int i = 0; i < vStatistiqueVentes.size(); i++) {
                            labels.append("'" + vStatistiqueVentes.get(i).getNomGenre() + "'");
                            data.append(vStatistiqueVentes.get(i).getNombreVente());

                            if (i < vStatistiqueVentes.size() - 1) {
                                labels.append(", ");
                                data.append(", ");
                            }
                        }

                        labels.append("]");
                        data.append("]");
                    %>
                    <script>
                        // Récupérez le contexte du canevas
                        var ctx = document.getElementById('chart').getContext('2d');

                        // Définissez vos données de graphique (à titre d'exemple)
                        var data = {
                            labels: <%= labels %>,
                            datasets: [{
                                label: 'Nombre de ventes',
                                data: <%= data %>,
                                backgroundColor: [
                                    'rgba(75, 192, 192, 0.2)', // Couleur pour Homme
                                    'rgba(255, 99, 132, 0.2)'   // Couleur pour Femme
                                ],
                                borderColor: [
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(255, 99, 132, 1)'
                                ],
                                borderWidth: 1
                            }]
                        };

                        var myChart = new Chart(ctx, {
                            type: 'doughnut', // ou 'line', 'pie', etc.
                            data: data
                        });
                    </script>
                </div>
            </div>
        </div>


        <% } %>
    </div>
</div>