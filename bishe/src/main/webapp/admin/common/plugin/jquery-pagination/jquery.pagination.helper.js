(function($){
	// Extend jQuery
	$.fn.paginationHelper = function(total, cur_page, per_page, opts) {

		// --------------------------------------
		// Initialize options with default values
		// --------------------------------------
		opts = jQuery.extend({
			current_page:0,			// 当前页
			items_per_page:20,		// 每页显示条数
			num_edge_entries:3,		// 左右边界显示的分页按钮个数
			num_display_entries:5,	// 分页按钮的显示个数
			prev_text:"上一页",		// 上一页按钮的显示文本
			next_text:"下一页",		// 下一页按钮的显示文本
			link_to:'javascript: void(0);',	// 分页按钮链接
			callback:null			// 分页按钮回调函数			
		},opts||{});
		opts.current_page = cur_page > 1 ? (cur_page - 1) : 0;
		opts.items_per_page = per_page == null ? 20 : per_page;

		// 默认回调函数
		var _pageselectCallback = function() {
			return true;
		};

		// 分页正则
		var _regEx = /([?&])(page=)\d*/ig;

		// 如果回调函数为空，则使用同步跳转方式切换页面
		if (null == opts.callback || typeof(opts.callback) != 'function') {
			var _url = window.location.href;
			if (_url.search(_regEx) < 0) {
				_url += (_url.search(/(.jsp|.html|.htm|.do)[?]/i) > 0 ? "&": "?") + "page=";
			}
			opts.link_to = _url.replace(_regEx, "$1$2__id__");		
			opts.callback = _pageselectCallback;
		};
		
		// 生成分页条
		$(this).pagination(total, opts);
	}
})(jQuery);