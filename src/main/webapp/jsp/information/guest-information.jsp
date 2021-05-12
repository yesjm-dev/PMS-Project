<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ax" tagdir="/WEB-INF/tags" %>

<ax:set key="title" value="${pageName}"/>
<ax:set key="page_desc" value="${PAGE_REMARK}"/>
<ax:set key="page_auto_height" value="true"/>

<ax:layout name="base">
    <jsp:attribute name="script">
        <script type="text/javascript" src="<c:url value='/assets/js/view/information/guest-information.js' />"></script>
    </jsp:attribute>
    <jsp:body>

        <ax:page-buttons></ax:page-buttons>

        <div role="page-header">
            <ax:form name="searchView0">
                <ax:tbl clazz="ax-search-tbl" minWidth="*">
                    <ax:tr>
                        <ax:td label='이름' width="300px">
                            <input type="text" class="form-control" />
                        </ax:td>
                        <ax:td label='전화번호' width="300px">
                            <input type="text" class="form-control" />
                        </ax:td>
                        <ax:td label='이메일' width="300px">
                            <input type="text" class="form-control" />
                        </ax:td>
                    </ax:tr>
                    <ax:tr>
                        <ax:td label='투숙날짜' width="500px">
                            <button type="button" class="btn btn-today">오늘</button>
                            <button type="button" class="btn btn-yesterday">어제</button>
                            <button type="button" class="btn btn-3days">3일</button>
                            <button type="button" class="btn btn-7days">7일</button>
                            <button type="button" class="btn btn-1month">1개월</button>
                            <button type="button" class="btn btn-3month">3개월</button>
                            <button type="button" class="btn btn-6month">6개월</button>
                            <button type="button" class="btn btn-1year">1년</button>
                        </ax:td>
                    </ax:tr>
                </ax:tbl>
            </ax:form>
            <div class="H10"></div>
        </div>

        <ax:split-layout name="ax1" orientation="vertical">
            <ax:split-panel width="*" style="">

                <!-- 목록 -->
                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                    <div class="left">
                        <h2><i class="cqc-list"></i>
                            투숙객 목록 </h2>
                    </div>
                    <!-- <div class="right">
                        <button type="button" class="btn btn-default" data-grid-view-01-btn="add"><i class="cqc-circle-with-plus"></i> 추가</button>
                        <button type="button" class="btn btn-default" data-grid-view-01-btn="delete"><i class="cqc-circle-with-plus"></i> 삭제</button>
                    </div> -->
                </div>
                <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 300px;"></div>
            </ax:split-panel>
            <ax:splitter></ax:splitter>
            <ax:split-panel width="*" style="padding-left: 10px;">
                <div data-fit-height-aside="form-view-01">
                    <div class="ax-button-group">
                        <div class="left">
                            <h2><i class="cqc-news"></i> 투숙객 정보 </h2>
                        </div>
                    </div>

                    <form name="form" class="js-form">
                        <ax:tbl clazz="ax-form-tbl" minWidth="100px">
                            <ax:tr labelWidth="100px">
                                <ax:td label="이름" width="40%">
                                    <input type="text" name="guestNm" data-ax-path="guestNm" class="form-control"/>
                                </ax:td>
                                <ax:td label="영문" width="40%">
                                    <input type="text" name="guestNmEng" data-ax-path="guestNmEng" class="form-control"/>
                                </ax:td>
                            </ax:tr>

                            <ax:tr labelWidth="100px">
                                <ax:td label="연락처" width="40%">
                                    <input type="text" name="guestTel" data-ax-path="guestTel" class="form-control"/>
                                </ax:td>
                                <ax:td label="이메일" width="40%">
                                    <input type="text" name="email" data-ax-path="email" class="form-control"  />
                                </ax:td>
                            </ax:tr>

                            <ax:tr labelWidth="100px">
                                <ax:td label="언어" width="40%">
                                    <input type="text" name="langCd" data-ax-path="langCd" title="사업자번호" class="form-control"/>
                                </ax:td>
                                <ax:td label="생년월일" width="40%">
                                    <input type="text" name="brth" data-ax-path="brth" class="form-control" />
                                </ax:td>
                            </ax:tr>
                            
                            <ax:tr labelWidth="100px">
                                <ax:td label="비고" width="100%">
                                    <textarea name="rmk" data-ax-path="rmk" rows="5" class="form-control"></textarea>
                                </ax:td>
                            </ax:tr>

                        </ax:tbl>
                    </form>
                </div>
                <ax:split-layout name="ax1" orientation="horizontal">
                    <div data-fit-height-aside="grid-view-02">
                        <div class="ax-button-group">
                            <div class="left">
                                <h2><i class="cqc-news"></i> 투숙 이력 </h2>
                            </div>
                        </div>
                        <div data-ax5grid="grid-view-02" data-fit-height-content="grid-view-02" style="height: 150px;"></div>
                    </div>
                </ax:split-layout>
            </ax:split-panel>
        </ax:split-layout>
    </jsp:body>
</ax:layout>