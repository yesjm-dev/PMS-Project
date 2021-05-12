var fnObj = {};
var ACTIONS = axboot.actionExtend(fnObj, {
    // PAGE_SEARCH: function (caller, act, data) {
    //     axboot.ajax({
    //         type: "GET",
    //         url: ["samples", "parent"],
    //         data: caller.searchView.getData(),
    //         callback: function (res) {
    //             caller.gridView01.setData(res);
    //         },
    //         options: {
    //             // axboot.ajax 함수에 2번째 인자는 필수가 아닙니다. ajax의 옵션을 전달하고자 할때 사용합니다.
    //             onError: function (err) {
    //                 console.log(err);
    //             }
    //         }
    //     });

    //     return false;
    // },
    PAGE_SAVE: function (caller, act, data) {
        var item = caller.formView01.getData();
        // console.log(item); return false;
        axboot.ajax({
            type: "POST",
            url: '/api/v1/chk',
            data: JSON.stringify(item),
            callback: function (res) {
                ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);
                axToast.push("저장 되었습니다");
            }
        });
    },
    ITEM_CLICK: function (caller, act, data) {

    },
    ITEM_ADD: function (caller, act, data) {
        caller.gridView01.addRow();
    },
    ITEM_DEL: function (caller, act, data) {
        caller.gridView01.delRow("selected");
    },
    dispatch: function (caller, act, data) {
        var result = ACTIONS.exec(caller, act, data);
        if (result != "error") {
            return result;
        } else {
            // 직접코딩
            return false;
        }
    }
});

// fnObj 기본 함수 스타트와 리사이즈
fnObj.pageStart = function () {
    this.pageButtonView.initView();
    this.searchView.initView();
    this.formView01.initView();

    ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);
};

fnObj.pageResize = function () {

};


fnObj.pageButtonView = axboot.viewExtend({
    initView: function () {
        axboot.buttonClick(this, "data-page-btn", {
            "search": function () {
                ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);
            },
            "save": function () {
                ACTIONS.dispatch(ACTIONS.PAGE_SAVE);
            },
            "excel": function () {

            }
        });
    }
});

//== view 시작
/**
 * searchView
 */
fnObj.searchView = axboot.viewExtend(axboot.searchView, {
    initView: function () {
        this.target = $(document["searchView0"]);
        this.target.attr("onsubmit", "return ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);");
        this.filter = $("#filter");
    },
    getData: function () {
        return {
            pageNumber: this.pageNumber,
            pageSize: this.pageSize,
            filter: this.filter.val()
        }
    }
});


/**
 * formView
 */
 fnObj.formView01 = axboot.viewExtend(axboot.formView, {
    getDefaultData: function () {
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    },
    getData: function () {
        var _this = this;
        var data = _this.model.get();
        if($('.js-advnYn').is(":checked")==true) {
            data.advnYn = 'Y';
        } else data.advnYn = 'N';
        return $.extend({}, data);

    },
    setData: function (data) {
        data = $.extend({}, data);
        this.model.setModel(data);
    },
    validate: function () {
        var item = this.model.get();

        var rs = this.model.validate();
        if (rs.error) {
            axDialog.alert(LANG('ax.script.form.validate', rs.error[0].jquery.attr('title')), function () {
                rs.error[0].jquery.focus();
            });
            return false;
        }
        return true;
    },
    initEvent: function () {
        axboot.buttonClick(this, 'data-form-view-01-btn', {
            'form-clear': function () {
                ACTIONS.dispatch(ACTIONS.FORM_CLEAR);
            },
        });
    },
    initView: function () {
        var _this = this; // fnObj.formView01

        _this.target = $('.js-form');

        this.model = new ax5.ui.binder();
        this.model.setModel({}, this.target);
        // this.modelFormatter = new axboot.modelFormatter(this.model); // 모델 포메터 시작

        this.initEvent();
    },
});
