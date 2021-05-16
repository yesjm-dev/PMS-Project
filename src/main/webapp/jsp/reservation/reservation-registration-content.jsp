<%@ page import="com.chequer.axboot.core.utils.RequestUtils" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ax" tagdir="/WEB-INF/tags" %>
<%
    RequestUtils requestUtils = RequestUtils.of(request);
    request.setAttribute("id", requestUtils.getString("id"));
%>
<ax:set key="title" value="${pageName}"/>
<ax:set key="page_desc" value="${PAGE_REMARK}"/>
<ax:set key="page_auto_height" value="true"/>

<ax:layout name="modal">
    <jsp:attribute name="script">
        <script>
            var modalParams = {id:"${id}"};
        </script>
        <script type="text/javascript" src="<c:url value='/assets/js/view/reservation/reservation-registration-content.js' />"></script>
    </jsp:attribute>
    <jsp:body>
        <ax:split-panel width="*" style="">
            <!-- 목록 -->
            <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                <div class="left">
                    <h2><i class="cqc-list"></i>투숙객 목록 </h2>
                </div>
            </div>
            <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 150px;"></div>
        </ax:split-panel>
        <ax:split-panel width="*" style="padding-top: 5px;">
            <div data-fit-height-aside="form-view-01">
                <form name="form" class="js-form">
                    <div data-ax-tbl class="ax-form-tbl">
                        <input type="hidden" name="id" data-ax-path="id" class="form-control">

                        <div data-ax-tr>
                            <div data-ax-td style="width:40%">
                                <div data-ax-td-label style="width:100px">이름</div>
                                <div data-ax-td-wrap>
                                    <input type="text" name="guestNm" data-ax-path="guestNm" class="form-control">
                                </div>
                            </div>
                            <div data-ax-td style="width:40%">
                                <div data-ax-td-label style="width:100px">영문</div>
                                <div data-ax-td-wrap>
                                    <input type="text" name="guestNmEng" data-ax-path="guestNmEng" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div data-ax-tr>
                            <div data-ax-td style="width:40%">
                                <div data-ax-td-label style="width:100px">연락처</div>
                                <div data-ax-td-wrap>
                                    <input type="text" name="guestTel" data-ax-path="guestTel" class="form-control">
                                </div>
                            </div>
                            <div data-ax-td style="width:40%">
                                <div data-ax-td-label style="width:100px">이메일</div>
                                <div data-ax-td-wrap>
                                    <input type="text" name="email" data-ax-path="email" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div data-ax-tr>
                            <div data-ax-td style="width:40%">
                                <div data-ax-td-label style="width:100px">언어</div>
                                <div data-ax-td-wrap>
                                    <input type="text" name="langCd" data-ax-path="langCd" class="form-control">
                                </div>
                            </div>
                            <div data-ax-td style="width:60%">
                                <div data-ax-td-label style="width:100px">생년월일</div>
                                <div data-ax-td-wrap>
                                    <input type="date" name="brth" data-ax-path="brth" class="form-control">
                                </div>
                                <div data-ax-td-wrap>
                                    <input type="radio" id="male" name="gender" data-ax-Path="gender" value="male">
                                    <label for="male">남</label>
                                    <input type="radio" id="female" name="gender" data-ax-Path="gender" value="female">
                                    <label for="female">여</label>
                                </div>
                            </div>
                        </div>
                        <div data-ax-tr>
                            <div data-ax-td style="width:80%">
                                <div data-ax-td-label style="width:100px">비고</div>
                                <div data-ax-td-wrap>
                                    <textarea name="rmk" data-ax-path="rmk" rows="5" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </ax:split-panel>
        <ax:split-panel width="*" style="">
            <ax:page-buttons class="bottom">
                <button type="button" class="btn btn-info" data-page-btn="save"> 선택 </button>
                <button type="button" class="btn btn-default" data-page-btn="close"> 닫기 </button>
            </ax:page-buttons>
        </ax:split-panel>
    </jsp:body>
</ax:layout>