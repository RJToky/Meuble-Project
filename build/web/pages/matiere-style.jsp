<% ArrayList<Style> styles = (ArrayList<Style>) request.getAttribute("styles"); %>

<div class="page-wrapper" style="display: block;">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-5 align-self-center">
                <h4 class="page-title">Liste des matieres selon le style</h4>
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
                            <form action="matiere-style" method="get" class="col-lg-4">
                                <label>Styles</label>
                                <div class="input-group">
                                    <select class="custom-select" name="idStyle" required="">
                                        <option value="">Choisir...</option>
                                        <% for (Style style : styles) { %>
                                        <% 
                                            boolean isSelected = false;
                                            int idStyle = 0;
                                            if(request.getAttribute("idStyle") != null) {
                                                idStyle = (int) request.getAttribute("idStyle");
                                                isSelected = (style.getId() == idStyle);
                                            }
                                        %>
                                        <option value="<%= style.getId() %>" <%= isSelected ? "selected" : "" %>><%= style.getNom() %></option>
                                        <% } %>
                                    </select>
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">Lister</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <% if(request.getAttribute("matieres") != null) { %>
                        <% ArrayList<Matiere> matieres = (ArrayList<Matiere>) request.getAttribute("matieres"); %>
                        <div class="row">
                            <div class="table-responsive col-lg-6">
                                <table class="table table-bordered">
                                    <thead class="table-active">
                                        <tr>
                                            <th>Id</th>
                                            <th>Nom de la matiere</th>
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