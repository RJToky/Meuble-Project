<% ArrayList<VDetailOuvrier> vDetailOuvriers = (ArrayList<VDetailOuvrier>) request.getAttribute("vDetailOuvriers"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Ouvrier /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des ouvriers</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom d'ouvrier</th>
                                        <th>Taux horaire actuel</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VDetailOuvrier vDetailOuvrier : vDetailOuvriers) { %>
                                    <tr>
                                        <td><%= vDetailOuvrier.getId() %></td>
                                        <td><%= vDetailOuvrier.getNomOuvrier() %></td>
                                        <td><%= vDetailOuvrier.getTauxHoraire() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
