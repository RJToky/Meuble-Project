<div>
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Alerte</h4>

    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <% if(request.getParameter("message") != null) { %>
                <% String alerte = (String) request.getParameter("message"); %>
                <h5 class="card-header"><%= alerte %></h5>
                <!--                <div class="card-body">
                                    <div class="row">
                                    </div>
                                </div>-->
                <% } %>
            </div>
        </div>
    </div>
</div>

