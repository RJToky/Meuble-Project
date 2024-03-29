<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Profil /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-profil" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom du profil</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Expert"
                                required=""
                                />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Annee</label>
                            <input
                                type="text"
                                class="form-control"
                                name="annee"
                                placeholder="Annee"
                                required=""
                                />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Coefficient</label>
                            <input
                                type="text"
                                class="form-control"
                                name="coefficient"
                                placeholder="Coefficient"
                                required=""
                                />
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
