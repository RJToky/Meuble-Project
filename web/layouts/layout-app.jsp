<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, model.*" %>

<% String active = (String) request.getAttribute("active"); %>
<% String content = (String) request.getAttribute("content"); %>

<!DOCTYPE html>
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="./assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Meuble</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="./assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="./assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="./assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="./assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="./assets/vendor/libs/apex-charts/apex-charts.css" />

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        
        <!-- Helpers -->
        <script src="./assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="./assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">

                <!-- Menu -->
                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="./index.jsp" class="app-brand-link">
                            <span class="app-brand-logo demo">
                                <svg
                                    width="25"
                                    viewBox="0 0 25 42"
                                    version="1.1"
                                    xmlns="http://www.w3.org/2000/svg"
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    >
                                <defs>
                                <path
                                    d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                                    id="path-1"
                                    ></path>
                                <path
                                    d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                                    id="path-3"
                                    ></path>
                                <path
                                    d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                                    id="path-4"
                                    ></path>
                                <path
                                    d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                                    id="path-5"
                                    ></path>
                                </defs>
                                <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                                <g id="Icon" transform="translate(27.000000, 15.000000)">
                                <g id="Mask" transform="translate(0.000000, 8.000000)">
                                <mask id="mask-2" fill="white">
                                    <use xlink:href="#path-1"></use>
                                </mask>
                                <use fill="#696cff" xlink:href="#path-1"></use>
                                <g id="Path-3" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-3"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                                </g>
                                <g id="Path-4" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-4"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                                </g>
                                </g>
                                <g
                                    id="Triangle"
                                    transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                                    >
                                <use fill="#696cff" xlink:href="#path-5"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                                </g>
                                </g>
                                </g>
                                </g>
                                </svg>
                            </span>
                            <span class="app-brand-text demo menu-text fw-bolder ms-2 text-capitalize">Meuble</span>
                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner my-1">
                        <li class="menu-header small text-uppercase mt-0">
                            <span class="menu-header-text">Pages</span>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("matiere")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Matière</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-matiere")) { out.print("active"); } %>">
                                    <a href="ajouter-matiere" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-matiere")) { out.print("active"); } %>">
                                    <a href="liste-matiere" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("acheter-matiere")) { out.print("active"); } %>">
                                    <a href="acheter-matiere" class="menu-link">
                                        <div>Acheter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("etat-stock-matiere")) { out.print("active"); } %>">
                                    <a href="etat-stock-matiere" class="menu-link">
                                        <div>Etat stock</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("style")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Style</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-style")) { out.print("active"); } %>">
                                    <a href="ajouter-style" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-style")) { out.print("active"); } %>">
                                    <a href="liste-style" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("style-matiere")) { out.print("active"); } %>">
                                    <a href="style-matiere" class="menu-link">
                                        <div>Matières utilisées</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("categorie")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Categorie</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-categorie")) { out.print("active"); } %>">
                                    <a href="ajouter-categorie" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-categorie")) { out.print("active"); } %>">
                                    <a href="liste-categorie" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("taille")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Taille</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-taille")) { out.print("active"); } %>">
                                    <a href="ajouter-taille" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-taille")) { out.print("active"); } %>">
                                    <a href="liste-taille" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("meuble")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Meuble</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-meuble")) { out.print("active"); } %>">
                                    <a href="ajouter-meuble" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-meuble")) { out.print("active"); } %>">
                                    <a href="liste-meuble" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("fabrication-meuble")) { out.print("active"); } %>">
                                    <a href="fabrication-meuble" class="menu-link">
                                        <div>Fabrication</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("vendre-meuble")) { out.print("active"); } %>">
                                    <a href="vendre-meuble" class="menu-link">
                                        <div>Vendre</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("etat-stock-meuble")) { out.print("active"); } %>">
                                    <a href="etat-stock-meuble" class="menu-link">
                                        <div>Etat stock</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("prix-vente-meuble")) { out.print("active"); } %>">
                                    <a href="prix-vente-meuble" class="menu-link">
                                        <div>Prix de vente</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("meuble-matiere")) { out.print("active"); } %>">
                                    <a href="meuble-matiere" class="menu-link">
                                        <div>Liste par matière</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("meuble-valeur")) { out.print("active"); } %>">
                                    <a href="meuble-valeur" class="menu-link">
                                        <div>Liste par valeur</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("meuble-benefice")) { out.print("active"); } %>">
                                    <a href="meuble-benefice" class="menu-link">
                                        <div>Liste par benefice</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("poste")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Poste</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-poste")) { out.print("active"); } %>">
                                    <a href="ajouter-poste" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-poste")) { out.print("active"); } %>">
                                    <a href="liste-poste" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("main-oeuvre")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Main d'oeuvre</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-main-oeuvre")) { out.print("active"); } %>">
                                    <a href="ajouter-main-oeuvre" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-main-oeuvre")) { out.print("active"); } %>">
                                    <a href="liste-main-oeuvre" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("profil")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Profil</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-profil")) { out.print("active"); } %>">
                                    <a href="ajouter-profil" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-profil")) { out.print("active"); } %>">
                                    <a href="liste-profil" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("employe")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Employe</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-employe")) { out.print("active"); } %>">
                                    <a href="ajouter-employe" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-employe")) { out.print("active"); } %>">
                                    <a href="liste-employe" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("client")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Client</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("ajouter-client")) { out.print("active"); } %>">
                                    <a href="ajouter-client" class="menu-link">
                                        <div>Ajouter</div>
                                    </a>
                                </li>
                                <li class="menu-item <% if(content.equalsIgnoreCase("liste-client")) { out.print("active"); } %>">
                                    <a href="liste-client" class="menu-link">
                                        <div>Liste</div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-item <% if(active.equalsIgnoreCase("statistique")) { out.print("active open"); } %>">
                            <a href="" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div>Statistique</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item <% if(content.equalsIgnoreCase("statistique-vente")) { out.print("active"); } %>">
                                    <a href="statistique-vente" class="menu-link">
                                        <div>Vente</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </aside>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->
                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar"
                        >
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    <i class="bx bx-search fs-4 lh-0"></i>
                                    <input
                                        type="text"
                                        class="form-control border-0 shadow-none"
                                        placeholder="Rechercher..."
                                        aria-label="Rechercher..."
                                        />
                                </div>
                            </div>
                            <!-- /Search -->

                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <img src="./assets/img/avatars/judi.jpeg" alt class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="./assets/img/avatars/judi.jpeg" alt class="w-px-40 h-auto rounded-circle" />
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block">RJ Toky</span>
                                                        <small class="text-muted">Admin</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <i class="bx bx-power-off me-2"></i>
                                                <span class="align-middle">Deconnexion</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->
                            </ul>
                        </div>
                    </nav>
                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">

                        <!-- Content -->
                        <div class="container-xxl flex-grow-1 container-p-y">

                            <% if (content.equalsIgnoreCase("alerte")) { %>
                            <%@ include file="../pages/alerte.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-matiere")) { %>
                            <%@ include file="../pages/ajouter-matiere.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-matiere")) { %>
                            <%@ include file="../pages/liste-matiere.jsp" %>

                            <% } else if(content.equalsIgnoreCase("acheter-matiere")) { %>
                            <%@ include file="../pages/acheter-matiere.jsp" %>

                            <% } else if(content.equalsIgnoreCase("etat-stock-matiere")) { %>
                            <%@ include file="../pages/etat-stock-matiere.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-style")) { %>
                            <%@ include file="../pages/ajouter-style.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-style")) { %>
                            <%@ include file="../pages/liste-style.jsp" %>

                            <% } else if(content.equalsIgnoreCase("style-matiere")) { %>
                            <%@ include file="../pages/style-matiere.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-categorie")) { %>
                            <%@ include file="../pages/ajouter-categorie.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-categorie")) { %>
                            <%@ include file="../pages/liste-categorie.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-taille")) { %>
                            <%@ include file="../pages/ajouter-taille.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-taille")) { %>
                            <%@ include file="../pages/liste-taille.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-meuble")) { %>
                            <%@ include file="../pages/ajouter-meuble.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-meuble")) { %>
                            <%@ include file="../pages/liste-meuble.jsp" %>

                            <% } else if(content.equalsIgnoreCase("vendre-meuble")) { %>
                            <%@ include file="../pages/vendre-meuble.jsp" %>
                            
                            <% } else if(content.equalsIgnoreCase("etat-stock-meuble")) { %>
                            <%@ include file="../pages/etat-stock-meuble.jsp" %>

                            <% } else if(content.equalsIgnoreCase("fabrication-meuble")) { %>
                            <%@ include file="../pages/fabrication-meuble.jsp" %>

                            <% } else if(content.equalsIgnoreCase("prix-vente-meuble")) { %>
                            <%@ include file="../pages/prix-vente-meuble.jsp" %>

                            <% } else if(content.equalsIgnoreCase("meuble-matiere")) { %>
                            <%@ include file="../pages/meuble-matiere.jsp" %>

                            <% } else if(content.equalsIgnoreCase("meuble-valeur")) { %>
                            <%@ include file="../pages/meuble-valeur.jsp" %>

                            <% } else if(content.equalsIgnoreCase("meuble-benefice")) { %>
                            <%@ include file="../pages/meuble-benefice.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-poste")) { %>
                            <%@ include file="../pages/ajouter-poste.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-poste")) { %>
                            <%@ include file="../pages/liste-poste.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-main-oeuvre")) { %>
                            <%@ include file="../pages/ajouter-main-oeuvre.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-main-oeuvre")) { %>
                            <%@ include file="../pages/liste-main-oeuvre.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-profil")) { %>
                            <%@ include file="../pages/ajouter-profil.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-profil")) { %>
                            <%@ include file="../pages/liste-profil.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-employe")) { %>
                            <%@ include file="../pages/ajouter-employe.jsp" %>

                            <% } else if(content.equalsIgnoreCase("liste-employe")) { %>
                            <%@ include file="../pages/liste-employe.jsp" %>

                            <% } else if(content.equalsIgnoreCase("ajouter-client")) { %>
                            <%@ include file="../pages/ajouter-client.jsp" %>
                            
                            <% } else if(content.equalsIgnoreCase("liste-client")) { %>
                            <%@ include file="../pages/liste-client.jsp" %>

                            <% } else if(content.equalsIgnoreCase("statistique-vente")) { %>
                            <%@ include file="../pages/statistique-vente.jsp" %>
                            <% } %>
                        </div>
                        <!-- / Content -->

                        <div class="content-backdrop fade"></div>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

            <!-- Overlay -->
            <div class="layout-overlay layout-menu-toggle"></div>
        </div>
        <!-- / Layout wrapper -->

        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
        <script src="./assets/vendor/libs/jquery/jquery.js"></script>
        <script src="./assets/vendor/libs/popper/popper.js"></script>
        <script src="./assets/vendor/js/bootstrap.js"></script>
        <script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="./assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Main JS -->
        <script src="./assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="./assets/js/dashboards-analytics.js"></script>

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>
</html>

