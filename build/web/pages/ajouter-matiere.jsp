<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Mati�re /</span> Ajouter</h4>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <h5 class="card-header">Formulaire</h5>
                <div class="card-body">
                    <form action="ajouter-matiere" method="post">
                        <div class="mb-3">
                            <label class="form-label">Nom de la matiere</label>
                            <input
                                type="text"
                                class="form-control"
                                name="nom"
                                placeholder="ex : Plastique"
                                required
                                />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Prix unitaire</label>
                            <input
                                type="number"
                                class="form-control"
                                name="prixUnitaire"
                                placeholder="100000"
                                required
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
