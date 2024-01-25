<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Meuble /</span> Liste par benefice</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <h5 class="card-header">Liste par benefice</h5>
                <div class="card-body">
                    <div class="row">
                        <form class="col-12" action="meuble-benefice" method="get">
                            <%
                                boolean beneficeMinIsSet = false;
                                boolean beneficeMaxIsSet = false;
                                if(request.getAttribute("beneficeMin") != null && request.getAttribute("beneficeMax") != null) {
                                    beneficeMinIsSet = true;
                                    beneficeMaxIsSet = true;
                                }
                            %>
                            <div class="row d-flex align-items-end">
                                <div class="col-4 mb-3">
                                    <label class="form-label">Benefice min</label>
                                    <input
                                        type="number"
                                        class="form-control"
                                        name="beneficeMin"
                                        placeholder="0"
                                        value="<%= beneficeMinIsSet ? request.getAttribute("beneficeMin") : "" %>"
                                        required
                                        />
                                </div>
                                <div class="col-4 px-0 mb-3">
                                    <label class="form-label">Benefice max</label>
                                    <input
                                        type="number"
                                        class="form-control"
                                        name="beneficeMax"
                                        placeholder="100000"
                                        value="<%= beneficeMaxIsSet ? request.getAttribute("beneficeMax") : "" %>"
                                        required
                                        />
                                </div>

                                <div class="col-auto mb-3">
                                    <button type="submit" class="btn btn-primary">Lister</button>
                                </div>
                            </div>
                        </form> 
                    </div>

                    <% if(request.getAttribute("vMeubleBenefices") != null) { %>
                    <% ArrayList<VMeubleBenefice> vMeubleBenefices = (ArrayList<VMeubleBenefice>) request.getAttribute("vMeubleBenefices"); %>
                    <div class="row mt-4">
                        <div class="table-responsive col-12">
                            <table class="table">
                                <thead class="table-active">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nom du meuble</th>
                                        <th>Taille</th>
                                        <th>Benefice</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(VMeubleBenefice vMeubleBenefice : vMeubleBenefices) { %>
                                    <tr>
                                        <td><%= vMeubleBenefice.getId() %></td>
                                        <td><%= vMeubleBenefice.getNomMeuble() %></td>
                                        <td><%= vMeubleBenefice.getNomTaille() %></td>
                                        <td><%= vMeubleBenefice.getBenefice() %></td>
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
</div>

