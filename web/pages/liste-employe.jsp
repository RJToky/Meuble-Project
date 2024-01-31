<% ArrayList<VProfilEmploye> vProfilEmployes = (ArrayList<VProfilEmploye>) request.getAttribute("vProfilEmployes"); %>

<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Employe /</span> Liste</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste des employes</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom de l'employe</th>
                                        <th>Profil</th>
                                        <th>Poste</th>
                                        <th>Date d'embauche</th>
                                        <th>Annee d'experience</th>
                                        <th>Taux horaire</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VProfilEmploye vProfilEmploye : vProfilEmployes) { %>
                                    <tr>
                                        <td><%= vProfilEmploye.getIdEmploye() %></td>
                                        <td><%= vProfilEmploye.getNomEmploye() %></td>
                                        <td><%= vProfilEmploye.getProfil() %></td>
                                        <td><%= vProfilEmploye.getNomPoste() %></td>
                                        <td><%= vProfilEmploye.getDateEmbauche() %></td>
                                        <td><%= vProfilEmploye.getAnneeExperience() %></td>
                                        <td><%= vProfilEmploye.getTauxHoraire() %></td>
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