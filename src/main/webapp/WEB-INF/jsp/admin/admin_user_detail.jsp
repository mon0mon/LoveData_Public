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
    <title>Admin User</title>
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
                            <p><a href="/admin/user/1" class="highlight-selected-text-menu">?????? ??????</a></p>
                            <p><a href="/admin/buisnessman" class="highlight-not-selected-text-menu">????????? ??????</a></p>
                            <p><a href="/admin/event" class="highlight-not-selected-text-menu">????????? ??????</a></p>
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
            <h2>?????? ??????</h2>
            <table class="table-bordered table text-center " >
                <thead>
                    <th scope="col">??????</th>
                    <th scope="col">?????????</th>
                    <th scope="col">?????? ??????</th>
                    <th scope="col">?????? ??????</th>
                    <th scope="col">??????</th>
                    <th scope="col">?????? ??????</th>
                </thead>
                <tbody id="tableBody">
                    <tr>
                        <td>${user.user_no}</td>
                        <td>${user.user_nic}</td>
                        <td>${user.user_name}</td>
                        <td>${user.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                        <c:choose>
                            <c:when test="${user.user_Activation eq false}">
                                <td>??????</td>
                            </c:when>
                            <c:when test="${user.user_Activation eq true}">
                                <td>??????</td>
                            </c:when>
                        </c:choose>
                        <td>${user.social_info}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="tab-content mx-2" >
            <h2>??????</h2>
            <table id="table" class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">??????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                </thead>
                <tbody>
                <c:forEach var="locs" items="${loc}">
                    <c:choose>
                        <c:when test="${locs._deleted eq false}">
                            <tr style="cursor:hand; background: #e2eeff;" onclick="location.href='/service/loc_detail?locNo=${locs.loc_no}'">
                                <td>${locs.loc_no}</td>
                                <td>${locs.loc_name}</td>
                                <td>${locs.siDo} ${locs.siGunGu}</td>
                                <td>${locs.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${locs.tel}</td>
                                <td>${locs.viewCount}</td>
                            </tr>
                        </c:when>
                        <c:when test="${locs._deleted eq true}">
                            <tr style="cursor:hand; background: #ffdef2;" onclick="location.href='/service/loc_detail?locNo=${locs.loc_no}'">
                                <td>${locs.loc_no}</td>
                                <td>${locs.loc_name}</td>
                                <td>${locs.siDo} ${locs.siGunGu}</td>
                                <td>${locs.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${locs.tel}</td>
                                <td>${locs.viewCount}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content">
            <h2>??????</h2>
            <table class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                </thead>
                <tbody>
                <c:forEach var="cors" items="${cor}">
                    <c:choose>
                        <c:when test="${cors._deleted eq false}">
                            <tr style="cursor:hand; background: #e2eeff;" onclick="location.href='/service/cor_detail?corNo=${cors.cor_no}'">
                                <td>${cors.cor_no}</td>
                                <td>${cors.cor_name}</td>
                                <td>${cors.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${cors.viewCount}</td>
                                <td>${cors.likeCount}</td>
                            </tr>
                        </c:when>
                        <c:when test="${cors._deleted eq true}">
                            <tr style="cursor:hand; background: #ffdef2;" onclick="location.href='/service/cor_detail?corNo=${cors.cor_no}'">
                                <td>${cors.cor_no}</td>
                                <td>${cors.cor_name}</td>
                                <td>${cors.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${cors.viewCount}</td>
                                <td>${cors.likeCount}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content">
            <h2>??????</h2>
            <table class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">??????</th>
                </thead>
                <tbody>
                <c:forEach var="revs" varStatus="index" items="${rev}">
                    <c:choose>
                        <c:when test="${revs._deleted eq false}">
                            <tr style="cursor:hand; background: #e2eeff;" onclick="location.href='/service/cor_detail?corNo=${revs.corNo}&page=${RevPageNum.get(index.count-1)}'">
                                <td>${revs.revNo}</td>
                                <td>${revs.corNo}</td>
                                <td>${rev_cor_name.get(index.count-1).cor_name}</td>
                                <td>${revs.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${revs.rev_like}</td>
                                <td>${revs.rev_dislike}</td>
                                <td>${revs.sc_total}</td>
                            </tr>
                        </c:when>
                        <c:when test="${revs._deleted eq true}">
                            <tr style="cursor:hand; background: #ffdef2;" onclick="location.href='/service/cor_detail?corNo=${revs.corNo}&page=${RevPageNum.get(index.count-1)}'">
                                <td>${revs.revNo}</td>
                                <td>${revs.corNo}</td>
                                <td>${rev_cor_name.get(index.count-1).cor_name}</td>
                                <td>${revs.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${revs.rev_like}</td>
                                <td>${revs.rev_dislike}</td>
                                <td>${revs.sc_total}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content">
            <h2>??????</h2>
            <table class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                </thead>
                <tbody>
                <c:forEach var="coms" varStatus="index" items="${com}">
                    <c:choose>
                        <c:when test="${coms._deleted eq false}">
                            <tr style="cursor:hand; background: #e2eeff;"
                                onclick="location.href='/service/loc_detail?locNo=${coms.getLocation().loc_no}&page=${ComPageNum.get(index.count-1)}'">
                                <td>${coms.cmtNo}</td>
                                <td>${coms.getLocation().loc_no}</td>
                                <td>${coms.getLocation().loc_name}</td>
                                <td>${coms.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${coms.likeCount}</td>
                            </tr>
                        </c:when>
                        <c:when test="${coms._deleted eq true}">
                            ${RevPageNum.size()}
                            <tr style="cursor:hand; background: #ffdef2;" onclick="location.href='/service/loc_detail?locNo=${coms.getLocation().loc_no}&page=${ComPageNum.get(index.count-1)}'">
                                <td>${coms.cmtNo}</td>
                                <td>${coms.getLocation().loc_no}</td>
                                <td>${coms.getLocation().loc_name}</td>
                                <td>${coms.regDate.format(simpleDateTimeFormatter.dateTimeFormatter)}</td>
                                <td>${coms.likeCount}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content">
            <h2>????????? : ${point}</h2>
            <table class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">????????? ??????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">????????? ??? ????????? ??????</th>
                </thead>
                <tbody>
                <c:forEach var="pointL" varStatus="index" items="${pointlist}">
                    <c:choose>
                        <c:when test="${pointL.get_plus_mi eq true}">
                            <tr>
                                <td>${pointL.point_no}</td>
                                <td>${pointL.point}</td>
                                <td>${pointL.point_get_out}</td>
                                <td></td>
                                <td>${pointL.get_no_use_no}</td>
                            </tr>
                        </c:when>
                        <c:when test="${pointL.get_plus_mi eq false}">
                            <tr style="cursor:hand; background: #ffdef2;">
                                <td>${pointL.point_no}</td>
                                <td>${pointL.point}</td>
                                <td></td>
                                <td>${pointL.point_get_out}</td>
                                <td>${pointL.get_no_use_no}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content">
            <h2>????????? ?????? ??????</h2>
            <table class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">????????? ??????</th>
                <th scope="col">????????? ??????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????????</th>
                <th scope="col">?????? ????????????</th>
                </thead>
                <tbody>
                <c:forEach var="even" varStatus="index" items="${eve}">
                    <tr onclick="location.href='/ServiceCenter/Event_Post/${even.ev_no}';">
                        <td>${even.ev_no}</td>
                        <td>${even.ev_title}</td>
                        <td>${even.ev_start}</td>
                        <td>${even.ev_stop}</td>
                        <td>${even.ev_end}</td>
                        <td>${eveattend.get(index.count-1)}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content">
            <h2>????????????</h2>
            <table class="table-bordered table text-center tables" >
                <thead>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ??????</th>
                <th scope="col">?????? ???</th>
                <th scope="col">?????? ??????</th>
                </thead>
                <tbody>
                <c:forEach var="uss" items="${us}">
                    <c:choose>
                        <c:when test="${uss.progress eq 0}">
                            <tr>
                                <td>${uss.user_suspension_no}</td>
                                <td>${uss.rc_no}</td>
                                <td>${uss.re_content}</td>
                                <td>${uss.start_day}</td>
                                <td>${uss.stop_day}</td>
                                <td>${uss.end_day}</td>
                            </tr>
                        </c:when>
                        <c:when test="${uss.progress eq 1}">
                            <tr style="cursor:hand; background: #ffdef2;">
                                <td>${uss.user_suspension_no}</td>
                                <td>${uss.rc_no}</td>
                                <td>${uss.re_content}</td>
                                <td>${uss.start_day}</td>
                                <td>${uss.stop_day}</td>
                                <td>${uss.end_day}</td>
                            </tr>
                        </c:when>
                        <c:when test="${uss.progress eq 2}">
                            <tr style="cursor:hand; background: #fff8de;">
                                <td>${uss.user_suspension_no}</td>
                                <td>${uss.rc_no}</td>
                                <td>${uss.re_content}</td>
                                <td>${uss.start_day}</td>
                                <td>${uss.stop_day}</td>
                                <td>${uss.end_day}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tab-content" >
            <div class="d-flex container align-items-center">
                <h2 class="d-flex align-items-center">?????? ??????</h2>
                <c:choose>
                    <c:when test="${user.user_Activation eq false}">
                        <button class="d-flex mx-2 align-items-center btn-primary" onclick="location.href='/admin/user_release/${user.user_no}'">?????? ??????</button>
                    </c:when>
                </c:choose>
            </div>
            <form class="d-flex container" action="/admin/user_suspension" method="post">
                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                <input type="hidden" name="user_no" value="${user.user_no}">
                <span class="d-flex col-1 justify-content-center align-items-center border border-secondary">????????????</span>
                <textarea class="d-flex container justify-content-center"  type="text" name="re_content" placeholder="??????????????? ????????? ?????????"></textarea>
                <span class="d-flex col-1 justify-content-center align-items-center border border-secondary">?????? ???</span>
                <input class="d-flex col-1 container justify-content-center"  type="number" name="stop_day" placeholder="?????? ???">
                <button class="btn-primary d-flex col-1 container align-items-center justify-content-center"  type="submit">??????</button>
            </form>
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