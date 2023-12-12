<%@ page import="java.util.ArrayList, model.Matiere" %>
<% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>


<div class="page-wrapper" style="display: block;">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Insertion style</h4>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row mb-4">
                            <form class="col-lg-4 col-md-6" action="style" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Nom du style</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="nom"
                                        placeholder="ex : Moderne"
                                        />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Selectionner les matieres</label>
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
                                    <button type="submit" class="btn btn-success w-100">Valider</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Page Content -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right sidebar -->
        <!-- ============================================================== -->
        <!-- .right-sidebar -->
        <!-- ============================================================== -->
        <!-- End Right sidebar -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <footer class="footer text-center">
        All Rights Reserved by Nice admin. Designed and Developed by
        <a href="https://wrappixel.com">WrapPixel</a>.
    </footer>
    <!-- ============================================================== -->
    <!-- End footer -->
    <!-- ============================================================== -->
</div>