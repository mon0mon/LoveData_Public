<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<html><jsp:useBean id="defaultDateTimeFormatter" class="com.project.love_data.util.DefaultLocalDateTimeFormatter"></jsp:useBean>
<jsp:useBean id="simpleDateTimeFormatter" class="com.project.love_data.util.SimpleLocalDateTimeFormatter"></jsp:useBean>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href=" https://cdn.datatables.net/rowgroup/1.1.4/css/rowGroup.bootstrap5.min.css"/>
    <link rel="stylesheet" href="/css/service/loc.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

        body {
            font-family: 'Jua', sans-serif;
        }
        th, td {
            vertical-align : middle;
        }
    </style>
    <title>Admin Event</title>
</head>
<%@ include file="../layout/header.jsp" %>
<body class="bg-light">
<div class="container-fluid d-flex" style="padding-top: 100px">
    <div class="col-2" id="sidebar">
        <ul class="nav nav-pills flex-column col-2 position-fixed" style="top: 40%">
            <div class="accordion text-center" id="loc">
                <hr>
                <div class="card">
                    <div class="card-header" id="headingLoc">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block loc_highlight-selected-nav-menu" type="button"
                                    data-toggle="collapse"
                                    data-target="#loc_collapse" aria-expanded="true" aria-controls="collapseOne">
                                ?????????
                            </button>
                        </h2>
                    </div>
                    <div id="loc_collapse" class="collapse show" aria-labelledby="headingLoc" data-parent="#loc">
                        <div class="card-body center-pill">
                            <p><a href="/admin/dash" class="highlight-not-selected-text-menu">????????????</a></p>
                            <p><a href="/admin/user/1" class="highlight-not-selected-text-menu">?????? ??????</a></p>
                            <p><a href="/admin/buisnessman" class="highlight-not-selected-text-menu">????????? ??????</a></p>
                            <p><a href="/admin/event" class="highlight-selected-text-menu">????????? ??????</a></p>
                            <p><a href="/admin/SendMessage" class="highlight-not-selected-text-menu">????????? ??????</a></p>
                            <p><a type="button" class="accordion highlight-not-selected-text-menu" data-toggle="collapse" data-target="#service_collapse" aria-expanded="false">??????????????? ????????????</a></p>
                            <div id="service_collapse" class="panel-collapse collapse">
                                <p>
                                    <a href="/admin/notice/1" class="highlight-not-selected-text-menu">- ????????????</a>
                                </p>
                                <p>
                                    <a href="/admin/qna/1" class="highlight-not-selected-text-menu">- ????????????</a>
                                </p>
                            </div>
                            <p><a href="/admin/upload_cache" class="highlight-not-selected-text-menu">upload ?????? ?????? ??????</a></p>
                            <p class="mb-0"><a href="/admin/report_center" class="highlight-not-selected-text-menu">?????? ??????</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </ul>
    </div>
    <div class="container-xl p-5 ms-3">
        <div class="tab-content mx-2" >
            <h2>????????? ??????</h2>
            <table class="table-bordered table text-center " >
                <thead>
                    <th scope="col">????????? ??????</th>
                    <th scope="col">??????</th>
                    <th scope="col">?????????</th>
                    <th scope="col">?????????</th>
                    <th scope="col">?????????</th>
                    <th scope="col">?????????</th>
                    <th scope="col">?????????</th>
                    <th scope="col">?????? ???</th>
                </thead>
                <tbody id="tableBody">
                <tr>
                    <td>${eve.ev_no}</td>
                    <td>${eve.ev_title}</td>
                    <td>${eve.ev_manager}</td>
                    <td>${eve.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                    <td>${eve.ev_start}</td>
                    <td>${eve.ev_stop}</td>
                    <td>${eve.ev_end}</td>
                    <td>${eve.ev_item}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-content mx-2" >
            <h2>????????? ??????: ${eve.ev_title}</h2>
            ${eve.ev_text}
        </div>
        <div class="tab-content mx-2" >
            <h2>????????? ?????????</h2>
            <table class="table-bordered table text-center " >
                <thead>
                    <th scope="col">?????? ??????(??????)</th>
                    <th scope="col">?????? ??????</th>
                    <th scope="col">?????? ?????????</th>
                </thead>
                <tbody id="tableBodys">
                    <c:forEach varStatus="index" var="wins" items="${win}">
                        <tr onclick="location.href='/admin_user_detail/${wins.user_no}'">
                            <td>${wins.ranking}</td>
                            <td>${wins.user_no}</td>
                            <td>${win_user.get(index.count-1).user_email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<!--  ??????????????? js ?????? -->
<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>

<script defer src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script defer src="https://cdn.datatables.net/1.11.3/js/dataTables.jqueryui.min.js"></script>
<script defer src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
<script defer src="https://cdn.datatables.net/rowgroup/1.1.4/js/dataTables.rowGroup.min.js"></script>
<script defer src="/js/datatable.js"></script>

</html>